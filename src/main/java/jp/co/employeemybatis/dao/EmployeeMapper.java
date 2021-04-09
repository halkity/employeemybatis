package jp.co.employeemybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import jp.co.employeemybatis.entity.Employee;
import jp.co.employeemybatis.util.MyBatisUtil;

@Repository
public class EmployeeMapper {

	public List<Employee> getAllEmployees() {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<Employee> eList = sqlSession.selectList("getAllEmployees");
		sqlSession.commit();
		sqlSession.close();
		return eList;
	}
	
	public List<Employee> findEmployeeLike(Employee employee){
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		@SuppressWarnings("unchecked")
		List<Employee> eList = sqlSession.selectList("findEmployeeLike", employee);
		sqlSession.commit();
		sqlSession.close();
		return eList;
	}
	
	public void saveEmployee(Employee employee){
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		sqlSession.insert("insertEmployee", employee);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public Employee findById(int employeeId){
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		Employee employee = (Employee)sqlSession.selectOne("findById", employeeId);
		sqlSession.commit();
		sqlSession.close();
		return employee;
	}
	
	public void updateEmployee(Employee employee){
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		sqlSession.update("updateEmployee", employee);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public void deleteEmployee(int employeeId) {
		SqlSession sqlSession = MyBatisUtil.getSqlSessionFactory().openSession();
		sqlSession.delete("deleteEmployee",employeeId);
		sqlSession.commit();
		sqlSession.close();
	}
}
