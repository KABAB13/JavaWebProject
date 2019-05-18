import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class abc {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try{
			Class.forName("com.mysql.jdbc.Driver"); //加载驱动程序
			System.out.println("Success loading Mysql Driver!");
			Connection conn = DriverManager.getConnection
			("jdbc:mysql://localhost:3306/maiba?serverTimezone=GMT%2B8","root","3082"); //连接mysql数据库
			System.out.println("Success loading Mysql Connection!");
			Statement stmt = conn.createStatement();
			if (!conn.isClosed()) {
				System.out.println("数据库连接成功");
			} else {
				System.out.println("数据库连接失败");
			}
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
