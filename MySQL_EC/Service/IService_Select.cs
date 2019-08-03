﻿using System.Collections.Generic;
using System.Data;

namespace MySQL_EC
{
    /// <summary>
    /// 查询相关
    /// </summary>
    public interface IService_Select
    {
        /// <summary>
        /// 查询的方法
        /// </summary>
        /// <param name="table_name">表名</param>
        /// <param name="Requirement_list">条件列表</param>
        /// <param name="Sort"></param>
        /// <param name="ShowFiled"></param>
        /// <returns>json</returns>
        string Select(string table_name, List<SQLRequirement> Requirement_list, string Sort, string ShowFiled = "*");
        /// <summary>
        /// 
        /// </summary>
        /// <param name="table_name"></param>
        /// <param name="Requirement_list"></param>
        /// <param name="Sort"></param>
        /// <param name="ShowFiled"></param>
        /// <returns></returns>
        DataTable SelectToDateTable(string table_name, List<SQLRequirement> Requirement_list, string Sort, string ShowFiled = "*");
    }
}
