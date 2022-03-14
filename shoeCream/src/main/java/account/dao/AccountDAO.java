package account.dao;

import account.bean.AccountDTO;

public interface AccountDAO {
	public AccountDTO getAccountByUserId(int userId);

	public void updateAccount(AccountDTO accountDTO);
}
