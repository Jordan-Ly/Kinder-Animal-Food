package au.usyd.elec5619.KAF.dao;

import java.util.List;

import au.usyd.elec5619.KAF.model.Brand;


public interface BrandDao {
	
	List<Brand> searchBrandByName(String brand_name);
	
	Brand searchBrandByID(Integer brand_id);
	
	List<Brand> searchBrand(Brand brand);
	
	List<Brand> brandList();
	
	boolean insertBrand(Brand brand);
	
	boolean deleteBrand(Integer brand_id);
	
	boolean editBrand(Brand brand);
	 
}