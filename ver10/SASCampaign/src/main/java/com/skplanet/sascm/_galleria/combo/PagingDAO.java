package com.skplanet.sascm._galleria.combo;

import org.springframework.stereotype.Repository;

import com.skplanet.sascm.common.dao.AbstractDAO;
import com.skplanet.sascm.util.DataMap;

@Repository("PagingDAO")
public class PagingDAO extends AbstractDAO {

	public Integer exceptCustomerCount() {
		return (int) selectOne("exceptCustomer.exceptCustomerCount");
	}

	public Integer exceptCustomerUpdate(DataMap deliverParams) {
		return (int) update("exceptCustomer.exceptCustomerUpdate", deliverParams);
	}

}
