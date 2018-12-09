package Service;

import Dao.AdminDao;
import model.Admin;

public class AdminService {
	private AdminDao adminDao=new AdminDao();

	public Admin queryAdmin(String username, String password) {
		// TODO Auto-generated method stub
		return adminDao.queryAdmin(username, password);
	}
}
