package model.dao;

// DAO �� ������ Implementation ��ü�� �����ϴ� Ŭ����
// Factory Class
public class DAOFactory {
	
	public BackOrderDAO getBackOrderDAO() {
		return new BackOrderDAO();//~ImplŬ�������� ������	 
	}
	public CardDAO getCardDAO() {
		return new CardDAO();		
	}
	public CategoryDAO getCategoryDAO() {
		return new CategoryDAO();		
	}
	public Funding_trendDAO getFunding_trendDAO() {
		return new Funding_trendDAO();		 
	}
	public InterestDAO getInterestDAO() {
		return new InterestDAO();		
	}
	public LikesDAO getLikesDAO() {
		return new LikesDAO();		
	}
	public PaymentDAO getPaymentDAO() {
		return new PaymentDAO();		
	}
	public ProjectDAO getProjectDAO() {
		return new ProjectDAO();		
	}
	public Reward_optionDAO getReward_optionDAO() {
		return new Reward_optionDAO();		
	}
	public ShippingDAO getShippingDAO() {
		return new ShippingDAO();		
	}
	public UserDAO getUserDAO() {
		return new UserDAO();		
	}
}
