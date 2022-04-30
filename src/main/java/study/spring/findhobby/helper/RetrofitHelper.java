package study.spring.findhobby.helper;

import java.io.IOException;

import lombok.extern.slf4j.Slf4j;
import okhttp3.Headers;
import okhttp3.Interceptor;
import okhttp3.Interceptor.Chain;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.logging.HttpLoggingInterceptor;
import okhttp3.logging.HttpLoggingInterceptor.Level;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

@Slf4j
public class RetrofitHelper {

	public Retrofit getRetrofit(String baseUrl) {
		OkHttpClient.Builder httpClientBuilder = new OkHttpClient.Builder();

		HttpLoggingInterceptor logging = new HttpLoggingInterceptor(new MyLogger());

		logging.level(Level.BODY);
		httpClientBuilder.addInterceptor(logging);
		
		httpClientBuilder.addNetworkInterceptor(new MyInterceptor());

		OkHttpClient httpClient = httpClientBuilder.build();

		Retrofit.Builder builder = new Retrofit.Builder();

		builder.baseUrl(baseUrl);

		builder.addConverterFactory(GsonConverterFactory.create());

		builder.client(httpClient);

		Retrofit retrofit = builder.build();

		return retrofit;

	}

	public class MyLogger implements HttpLoggingInterceptor.Logger {
		@Override
		public void log(String logMessage) {
			// 전달받은 문자열을 로그로 저장한다.
			// --> 통신 과정이 기록된다.
			log.debug(logMessage);
		}
	}

	public class MyInterceptor implements Interceptor {

		@Override
		public Response intercept(Chain chain) throws IOException{
			Request originalRequest = chain.request();
			Request.Builder builder = originalRequest.newBuilder();
			builder.removeHeader("User-Agent");
			
			builder.header("User-Agent" ,"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36");
			
			Request newRequest = builder.build();
			Headers headers = newRequest.headers();
			
			for(int i =0; i< headers.size(); i++) {
				String name = headers.name(i);
				String values =headers.get(name);
				log.debug("(H) -> " + name + ": " +values);
			}
			return chain.proceed(newRequest);
		}
	}

}
