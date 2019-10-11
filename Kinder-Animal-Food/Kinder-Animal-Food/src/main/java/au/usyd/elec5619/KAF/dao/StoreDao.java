package au.usyd.elec5619.KAF.dao;

import java.util.List;

import au.usyd.elec5619.KAF.model.Store;

public interface StoreDao {
		
	List<Store> searchStore(String store_name);
	
	List<Store> searchStore(Store store);
	
	List<Store> storeList();
	
	boolean insertStore(Store store);
	
	boolean deleteStore(Integer store_id);
	
	boolean editStore(Store store);
	
}
