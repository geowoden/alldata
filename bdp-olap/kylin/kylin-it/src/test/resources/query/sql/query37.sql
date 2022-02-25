--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

select test_cal_dt.week_beg_dt, sum(test_kylin_fact.price) as GMV 
 , count(*) as TRANS_CNT 
 from test_kylin_fact 
 inner JOIN edw.test_cal_dt as test_cal_dt 
 ON test_kylin_fact.cal_dt = test_cal_dt.cal_dt 
 where 
 (test_kylin_fact.lstg_format_name > '') 
 and ( 
 (test_kylin_fact.lstg_format_name='FP-GTC') 
 OR 
 (test_cal_dt.week_beg_dt between DATE '2013-05-20' and DATE '2013-05-21') 
 ) 
 and ( 
 (test_kylin_fact.lstg_format_name='ABIN') 
 OR 
 (test_cal_dt.week_beg_dt between DATE '2013-05-20' and DATE '2013-05-21') 
 ) 
 group by test_cal_dt.week_beg_dt
;{"scanRowCount":10018,"scanBytes":384041,"scanFiles":2,"cuboidId":276480}