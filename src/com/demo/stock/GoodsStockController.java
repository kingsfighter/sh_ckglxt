package com.demo.stock;

import com.demo.common.model.GoodsStock;
import com.demo.common.result.Result;
import com.demo.util.EasyuiUtil;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;

/**
 * UserController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
 */
public class GoodsStockController extends Controller {
    public void index() {
        render("stock.jsp");
    }

    public void list() {
        Page<GoodsStock> page = GoodsStock.dao.paginate(getParaToInt(0, 1), 10);
        renderJson(EasyuiUtil.adapterEasyuiPage(page));
    }

    public void add() {
        GoodsStock gs = getModel(GoodsStock.class);
        gs.save();
        renderText(JsonKit.toJson(new Result()));
    }

    public void edit() {
        getModel(GoodsStock.class).update();
        renderText(JsonKit.toJson(new Result()));
    }

    public void delete() {
        GoodsStock.dao.deleteById(getParaToInt("id"));
        renderText(JsonKit.toJson(new Result()));
    }
}
