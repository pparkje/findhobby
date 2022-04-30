package study.spring.findhobby.service;

import java.util.List;

import study.spring.findhobby.model.Department;


public interface DepartmentService {

	public Department getDepartmentItem(Department input) throws Exception;

	public List<Department> getDepartmentList(Department input) throws Exception;

	public int getDepartmentCount(Department input) throws Exception;

	public int addDepartment(Department input) throws Exception;

	public int editDepartment(Department input) throws Exception;

	public int deleteDepartment(Department input) throws Exception;

}