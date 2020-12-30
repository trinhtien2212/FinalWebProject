package vn.thegioicaycanh.model.util;

import vn.thegioicaycanh.model.Product.Product;
import vn.thegioicaycanh.model.Product.ProductEntity;
import vn.thegioicaycanh.model.header_footer.LoadHeaderFooter;

import java.util.List;

public class tempTest {
    public static void main(String[] args) {
        System.out.println(LoadHeaderFooter.loadHeader());
        List<Product>discounts= ProductEntity.loadDiscountProducts(8);
        System.out.println(discounts.size());
    }
}
