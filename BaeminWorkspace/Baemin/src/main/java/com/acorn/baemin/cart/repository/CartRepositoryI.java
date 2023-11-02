package com.acorn.baemin.cart.repository;

import java.util.List;

import com.acorn.baemin.domain.CartDTO;
import com.acorn.baemin.domain.MenuDTO;
import com.acorn.baemin.domain.OptionDTO;
import com.acorn.baemin.domain.StoreDTO;
import com.mysql.cj.Session;



public interface CartRepositoryI {
	public List<CartDTO> selectCart(String id);
	public List<StoreDTO> selectStore(String id);
	public List<MenuDTO> selectMenu(List<CartDTO> cartList);
	public void deleteCart(String cartCode);
}
	
