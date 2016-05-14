package com.demo.common.model;

import java.util.List;

import com.demo.common.model.base.BaseMonitorObjectConfig;
import com.jfinal.plugin.activerecord.Page;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class MonitorObjectConfig extends BaseMonitorObjectConfig<MonitorObjectConfig> {
	public static final MonitorObjectConfig dao = new MonitorObjectConfig();
	
	public List<MonitorObjectConfig> findAll(){
	    return find("select * from monitor_object_config");
	}
	
	public Page<MonitorObjectConfig> paginate(int pageNumber, int pageSize) {
        return paginate(pageNumber, pageSize, "select *", "from monitor_object_config order by id asc");
    }
}
