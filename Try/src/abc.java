import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class abc {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try{
			Class.forName("com.mysql.jdbc.Driver"); //������������
			System.out.println("Success loading Mysql Driver!");
			Connection conn = DriverManager.getConnection
			("jdbc:mysql://localhost:3306/maiba?serverTimezone=GMT%2B8","root","3082"); //����mysql���ݿ�
			System.out.println("Success loading Mysql Connection!");
			Statement stmt = conn.createStatement();
			if (!conn.isClosed()) {
				System.out.println("���ݿ����ӳɹ�");
			} else {
				System.out.println("���ݿ�����ʧ��");
			}
			
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
