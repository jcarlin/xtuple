SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET SESSION AUTHORIZATION DEFAULT;

SET search_path = public, pg_catalog;

--
-- Data for Name: curr_symbol; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE curr_symbol DISABLE TRIGGER ALL;

INSERT INTO curr_symbol (curr_id, curr_base, curr_name, curr_symbol, curr_abbr) VALUES (2, false, 'US Dollars', '$', 'USD');

ALTER TABLE curr_symbol ENABLE TRIGGER ALL;

--
-- Data for Name: taxclass; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE taxclass DISABLE TRIGGER ALL;

INSERT INTO taxclass (taxclass_id, taxclass_code, taxclass_descrip, taxclass_sequence) VALUES (1, '1', 'Legacy Class 1', 0);
INSERT INTO taxclass (taxclass_id, taxclass_code, taxclass_descrip, taxclass_sequence) VALUES (2, '2', 'Legacy Class 2', 0);
INSERT INTO taxclass (taxclass_id, taxclass_code, taxclass_descrip, taxclass_sequence) VALUES (3, '3', 'Legacy Class 3', 0);

ALTER TABLE taxclass ENABLE TRIGGER ALL;

--
-- Data for Name: taxtype; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE taxtype DISABLE TRIGGER ALL;

INSERT INTO taxtype (taxtype_id, taxtype_name, taxtype_descrip, taxtype_sys) VALUES (1, 'Freight', 'System Defined Freight Tax Type. DO NOT CHANGE.', true);
INSERT INTO taxtype (taxtype_id, taxtype_name, taxtype_descrip, taxtype_sys) VALUES (2, 'Adjustment', 'System Defined Adjustment Tax Type. DO NOT CHANGE.', true);

ALTER TABLE taxtype ENABLE TRIGGER ALL;

--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE image DISABLE TRIGGER ALL;

INSERT INTO image (image_id, image_name, image_descrip, image_data) VALUES (14, 'Blue Pinstripe Background', 'Blue Pinstripe Background', 'begin 644 internal
MB5!.1PT*&@H````-24A$4@````(````""`(```#]U)IS````"7!(67,```L2
M```+$@''2W7[\````%DE$050(F6-DLNUD8&!@\?+R8F!@```-9P&L)F@250``
*``!)14Y$KD)@@@``
`
end
');

ALTER TABLE image ENABLE TRIGGER ALL;

--
-- Data for Name: sitetype; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE sitetype DISABLE TRIGGER ALL;

INSERT INTO sitetype (sitetype_id, sitetype_name, sitetype_descrip) VALUES (1, 'WHSE', 'Warehouse');

ALTER TABLE sitetype ENABLE TRIGGER ALL;

--
-- Data for Name: emp; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE emp DISABLE TRIGGER ALL;

INSERT INTO emp (emp_id, emp_code, emp_number, emp_active, emp_cntct_id, emp_warehous_id, emp_mgr_emp_id, emp_wage_type, emp_wage, emp_wage_curr_id, emp_wage_period, emp_dept_id, emp_shift_id, emp_notes, emp_image_id, emp_username, emp_extrate, emp_extrate_period, emp_startdate, emp_name) VALUES (2, 'ADMIN', 'admin', true, NULL, NULL, NULL, 'H', NULL, NULL, 'H', NULL, NULL, NULL, NULL, 'admin', NULL, 'H', NULL, 'Administrator');
INSERT INTO emp (emp_id, emp_code, emp_number, emp_active, emp_cntct_id, emp_warehous_id, emp_mgr_emp_id, emp_wage_type, emp_wage, emp_wage_curr_id, emp_wage_period, emp_dept_id, emp_shift_id, emp_notes, emp_image_id, emp_username, emp_extrate, emp_extrate_period, emp_startdate, emp_name) VALUES (1, 'MFGADMIN', 'mfgadmin', true, NULL, NULL, NULL, 'H', NULL, NULL, 'H', NULL, NULL, NULL, NULL, 'mfgadmin', NULL, 'H', NULL, 'OpenMFG Administrator');

ALTER TABLE emp ENABLE TRIGGER ALL;

--
-- Data for Name: costelem; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE costelem DISABLE TRIGGER ALL;

INSERT INTO costelem (costelem_id, costelem_type, costelem_sys, costelem_po, costelem_active, costelem_exp_accnt_id, costelem_cost_item_id) VALUES (3, 'Material', true, true, true, NULL, -1);
INSERT INTO costelem (costelem_id, costelem_type, costelem_sys, costelem_po, costelem_active, costelem_exp_accnt_id, costelem_cost_item_id) VALUES (4, 'Direct Labor', true, false, true, NULL, -1);
INSERT INTO costelem (costelem_id, costelem_type, costelem_sys, costelem_po, costelem_active, costelem_exp_accnt_id, costelem_cost_item_id) VALUES (5, 'Overhead', true, false, true, NULL, -1);
INSERT INTO costelem (costelem_id, costelem_type, costelem_sys, costelem_po, costelem_active, costelem_exp_accnt_id, costelem_cost_item_id) VALUES (6, 'Machine Overhead', true, false, true, NULL, -1);

ALTER TABLE costelem ENABLE TRIGGER ALL;

--
-- Data for Name: budghead; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE budghead DISABLE TRIGGER ALL;

INSERT INTO budghead (budghead_id, budghead_name, budghead_descrip) VALUES (1, 'Default', 'Default budget for conversion');

ALTER TABLE budghead ENABLE TRIGGER ALL;

--
-- Data for Name: ccbank; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE ccbank DISABLE TRIGGER ALL;

INSERT INTO ccbank (ccbank_id, ccbank_ccard_type, ccbank_bankaccnt_id) VALUES (1, 'A', NULL);
INSERT INTO ccbank (ccbank_id, ccbank_ccard_type, ccbank_bankaccnt_id) VALUES (2, 'D', NULL);
INSERT INTO ccbank (ccbank_id, ccbank_ccard_type, ccbank_bankaccnt_id) VALUES (3, 'M', NULL);
INSERT INTO ccbank (ccbank_id, ccbank_ccard_type, ccbank_bankaccnt_id) VALUES (4, 'P', NULL);
INSERT INTO ccbank (ccbank_id, ccbank_ccard_type, ccbank_bankaccnt_id) VALUES (5, 'V', NULL);

ALTER TABLE ccbank ENABLE TRIGGER ALL;

--
-- Data for Name: crmacct; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE crmacct DISABLE TRIGGER ALL;

INSERT INTO crmacct (crmacct_id, crmacct_number, crmacct_name, crmacct_active, crmacct_type, crmacct_cust_id, crmacct_competitor_id, crmacct_partner_id, crmacct_prospect_id, crmacct_vend_id, crmacct_cntct_id_1, crmacct_cntct_id_2, crmacct_parent_id, crmacct_notes, crmacct_taxauth_id, crmacct_owner_username, crmacct_emp_id, crmacct_salesrep_id, crmacct_usr_username) VALUES (1, 'ADMIN', 'Administrator', true, 'I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 'admin');
INSERT INTO crmacct (crmacct_id, crmacct_number, crmacct_name, crmacct_active, crmacct_type, crmacct_cust_id, crmacct_competitor_id, crmacct_partner_id, crmacct_prospect_id, crmacct_vend_id, crmacct_cntct_id_1, crmacct_cntct_id_2, crmacct_parent_id, crmacct_notes, crmacct_taxauth_id, crmacct_owner_username, crmacct_emp_id, crmacct_salesrep_id, crmacct_usr_username) VALUES (2, 'MFGADMIN', 'OpenMFG Administrator', true, 'I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'mfgadmin');

ALTER TABLE crmacct ENABLE TRIGGER ALL;

--
-- Data for Name: prjtype; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE prjtype DISABLE TRIGGER ALL;

INSERT INTO prjtype (prjtype_id, prjtype_code, prjtype_descr, prjtype_active) VALUES (1, 'Standard', 'Standard Projects', true);

ALTER TABLE prjtype ENABLE TRIGGER ALL;

--
-- Data for Name: saletype; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE saletype DISABLE TRIGGER ALL;

INSERT INTO saletype (saletype_id, saletype_code, saletype_descr, saletype_active) VALUES (1, 'CUST', 'Customer', true);
INSERT INTO saletype (saletype_id, saletype_code, saletype_descr, saletype_active) VALUES (2, 'INT', 'Internet', true);
INSERT INTO saletype (saletype_id, saletype_code, saletype_descr, saletype_active) VALUES (3, 'REP', 'Sales Rep', true);

ALTER TABLE saletype ENABLE TRIGGER ALL;

--
-- Data for Name: cmnttype; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE cmnttype DISABLE TRIGGER ALL;

INSERT INTO cmnttype (cmnttype_id, cmnttype_name, cmnttype_descrip, cmnttype_usedin, cmnttype_sys, cmnttype_editable, cmnttype_order) VALUES (1, 'General', 'General Comment', 'ICVPL', true, false, NULL);
INSERT INTO cmnttype (cmnttype_id, cmnttype_name, cmnttype_descrip, cmnttype_usedin, cmnttype_sys, cmnttype_editable, cmnttype_order) VALUES (2, 'ChangeLog', 'Change Log', 'ICVP', true, false, NULL);
INSERT INTO cmnttype (cmnttype_id, cmnttype_name, cmnttype_descrip, cmnttype_usedin, cmnttype_sys, cmnttype_editable, cmnttype_order) VALUES (3, 'Notes to Comment', 'Used by certain triggers to automatically create/update comment with content of notes.', NULL, true, false, NULL);

ALTER TABLE cmnttype ENABLE TRIGGER ALL;

--
-- Data for Name: cmnttypesource; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE cmnttypesource DISABLE TRIGGER ALL;

INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (76, 1, 1);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (77, 2, 1);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (78, 1, 2);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (79, 2, 2);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (80, 1, 3);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (81, 2, 3);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (82, 1, 4);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (83, 2, 4);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (84, 1, 5);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (85, 2, 5);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (86, 1, 6);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (87, 2, 6);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (88, 1, 7);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (89, 2, 7);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (90, 1, 8);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (91, 2, 8);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (92, 1, 9);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (93, 2, 9);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (94, 1, 10);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (95, 2, 10);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (96, 1, 11);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (97, 2, 11);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (98, 1, 12);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (99, 2, 12);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (100, 1, 13);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (101, 2, 13);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (102, 1, 14);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (103, 2, 14);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (104, 1, 15);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (105, 2, 15);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (106, 1, 16);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (107, 2, 16);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (108, 1, 17);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (109, 2, 17);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (110, 1, 18);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (111, 2, 18);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (112, 1, 19);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (113, 2, 19);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (114, 1, 20);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (115, 2, 20);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (116, 1, 21);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (117, 2, 21);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (118, 1, 22);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (119, 2, 22);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (120, 1, 23);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (121, 2, 23);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (122, 1, 24);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (123, 2, 24);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (124, 1, 25);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (125, 2, 25);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (126, 1, 26);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (127, 2, 26);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (128, 1, 27);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (129, 2, 27);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (130, 1, 28);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (131, 2, 28);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (132, 1, 29);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (133, 2, 29);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (134, 1, 30);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (135, 2, 30);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (136, 1, 31);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (137, 2, 31);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (138, 1, 32);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (139, 2, 32);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (140, 1, 33);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (141, 2, 33);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (142, 1, 34);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (143, 2, 34);
INSERT INTO cmnttypesource (cmnttypesource_id, cmnttypesource_cmnttype_id, cmnttypesource_source_id) VALUES (144, 3, 12);

ALTER TABLE cmnttypesource ENABLE TRIGGER ALL;

--
-- Data for Name: incdtpriority; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE incdtpriority DISABLE TRIGGER ALL;

INSERT INTO incdtpriority (incdtpriority_id, incdtpriority_name, incdtpriority_order, incdtpriority_descrip) VALUES (2, 'High', 1, NULL);
INSERT INTO incdtpriority (incdtpriority_id, incdtpriority_name, incdtpriority_order, incdtpriority_descrip) VALUES (3, 'Normal', 2, NULL);
INSERT INTO incdtpriority (incdtpriority_id, incdtpriority_name, incdtpriority_order, incdtpriority_descrip) VALUES (4, 'Low', 3, NULL);
INSERT INTO incdtpriority (incdtpriority_id, incdtpriority_name, incdtpriority_order, incdtpriority_descrip) VALUES (5, 'Very Low', 4, NULL);
INSERT INTO incdtpriority (incdtpriority_id, incdtpriority_name, incdtpriority_order, incdtpriority_descrip) VALUES (1, 'Very High', 0, NULL);

ALTER TABLE incdtpriority ENABLE TRIGGER ALL;

--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE comment DISABLE TRIGGER ALL;

INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (39, 1, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (40, 2, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (41, 3, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (42, 4, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (43, 5, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (44, 6, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (45, 7, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (46, 8, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (47, 9, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (48, 10, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (49, 11, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (50, 12, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (51, 13, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (52, 14, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (53, 15, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (54, 16, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (55, 17, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (56, 18, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (57, 19, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (58, 20, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (59, 21, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (60, 22, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (61, 23, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);
INSERT INTO comment (comment_id, comment_source_id, comment_date, comment_user, comment_text, comment_cmnttype_id, comment_source, comment_public) VALUES (62, 24, '2011-08-19 11:12:05.633058-04', 'admin', 'Created by admin', 2, 'CRMA', false);

ALTER TABLE comment ENABLE TRIGGER ALL;

--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE country DISABLE TRIGGER ALL;

INSERT INTO country (country_id, country_abbr, country_name, country_curr_abbr, country_curr_name, country_curr_number, country_curr_symbol, country_qt_number) VALUES
  (214, NULL, NULL, 'XTS', 'Code reserved for testing', '963', NULL, NULL),
  (  5, 'AD', 'Andorra', 'EUR', 'Euro', '978', '€', 5),
  (228, 'AE', 'United Arab Emirates', 'AED', 'UAE Dirham', '784', NULL, 223),
  (  1, 'AF', 'Afghanistan', 'AFN', 'Afghani', '971', NULL, 1),
  (  9, 'AG', 'Antigua And Barbuda', 'XCD', 'East Caribbean Dollar', '951', '$', 9),
  (  7, 'AI', 'Anguilla', 'XCD', 'East Caribbean Dollar', '951', '$', 7),
  (  2, 'AL', 'Albania', 'ALL', 'Lek', '8  ', 'Lek', 2),
  ( 11, 'AM', 'Armenia', 'AMD', 'Armenian Dram', '51 ', NULL, 11),
  (154, 'AN', 'Netherlands Antilles', 'ANG', 'Netherlands Antillian Guilder', '532', 'ƒ', 152),
  (  6, 'AO', 'Angola', 'AOA', 'Kwanza', '973', NULL, 6),
  (  8, 'AQ', 'Antarctica', NULL, NULL, NULL, NULL, 8),
  ( 10, 'AR', 'Argentina', 'ARS', 'Argentine Peso', '32 ', '$', 10),
  (  4, 'AS', 'American Samoa', 'USD', 'US Dollar', '840', '$', 4),
  ( 14, 'AT', 'Austria', 'EUR', 'Euro', '978', '€', 14),
  ( 13, 'AU', 'Australia', 'AUD', 'Australian Dollar', '36 ', '$', 13),
  ( 12, 'AW', 'Aruba', 'AWG', 'Aruban Guilder', '533', 'ƒ', 12),
  ( 15, 'AZ', 'Azerbaijan', 'AZN', 'Azerbaijanian Manat', '944', 'ман', 15),
  ( 27, 'BA', 'Bosnia And Herzegovina', 'BAM', 'Convertible Marks', '977', 'KM', 27),
  ( 19, 'BB', 'Barbados', 'BBD', 'Barbados Dollar', '52 ', '$', 19),
  ( 18, 'BD', 'Bangladesh', 'BDT', 'Taka', '50 ', NULL, 18),
  ( 21, 'BE', 'Belgium', 'EUR', 'Euro', '978', '€', 21),
  ( 35, 'BF', 'Burkina Faso', 'XOF', 'CFA Franc BCEAO', '952', NULL, 34),
  ( 34, 'BG', 'Bulgaria', 'BGN', 'Bulgarian Lev', '975', 'лв', 33),
  ( 17, 'BH', 'Bahrain', 'BHD', 'Bahraini Dinar', '48 ', NULL, 17),
  ( 36, 'BI', 'Burundi', 'BIF', 'Burundi Franc', '108', NULL, 35),
  ( 23, 'BJ', 'Benin', 'XOF', 'CFA Franc BCEAO', '952', NULL, 23),
  ( 24, 'BM', 'Bermuda', 'BMD', 'Bermudian Dollar', '60 ', '$', 24),
  ( 33, 'BN', 'Brunei Darussalam', 'BND', 'Brunei Dollar', '96 ', '$', 32),
  ( 26, 'BO', 'Bolivia', 'BOB', 'Boliviano', '68 ', '$', 26),
  ( 30, 'BR', 'Brazil', 'BRL', 'Brazilian Real', '986', 'R$', 30),
  ( 16, 'BS', 'Bahamas', 'BSD', 'Bahamian Dollar', '44 ', '$', 16),
  ( 25, 'BT', 'Bhutan', 'BTN', 'Ngultrum', '64 ', NULL, 25),
  ( 29, 'BV', 'Bouvet Island', 'NOK', 'Norwegian Krone', '578', 'kr', 29),
  ( 28, 'BW', 'Botswana', 'BWP', 'Pula', '72 ', 'P', 28),
  ( 20, 'BY', 'Belarus', 'BYR', 'Belarussian Ruble', '974', 'p.', 20),
  ( 22, 'BZ', 'Belize', 'BZD', 'Belize Dollar', '84 ', '$', 22),
  ( 39, 'CA', 'Canada', 'CAD', 'Canadian Dollar', '124', '$', 38),
  ( 47, 'CC', 'Cocos (Keeling) Islands', 'AUD', 'Australian Dollar', '36 ', '$', 46),
  ( 51, 'CD', 'Congo, The Democratic Republic Of', 'CDF', 'Franc Congolais', '976', NULL, 49),
  ( 42, 'CF', 'Central African Republic', 'XAF', 'CFA Franc BEAC', '950', NULL, 41),
  ( 50, 'CG', 'Congo', 'XAF', 'CFA Franc BEAC', '950', NULL, 50),
  (209, 'CH', 'Switzerland', 'CHF', 'Swiss Franc', '756', 'CHF', 206),
  (107, 'CI', 'Ivory Coast', 'XOF', 'CFA Franc BCEA', '952', NULL, 53),
  ( 52, 'CK', 'Cook Islands', 'NZD', 'New Zealand Dollar', '554', '$', 51),
  ( 44, 'CL', 'Chile', 'CLP', 'Chilean Peso', '152', '$', 43),
  ( 38, 'CM', 'Cameroon', 'XAF', 'CFA Franc BEAC', '950', NULL, 37),
  ( 45, 'CN', 'China', 'CNY', 'Yuan Renminbi', '156', '¥', 44),
  ( 48, 'CO', 'Colombia', 'COP', 'Colombian Peso', '170', '$', 47),
  ( 53, 'CR', 'Costa Rica', 'CRC', 'Costa Rican Colon', '188', '₡', 52),
  ( 55, 'CU', 'Cuba', 'CUP', 'Cuban Peso', '192', '₱', 55),
  ( 40, 'CV', 'Cape Verde', 'CVE', 'Cape Verde Escudo', '132', NULL, 39),
  ( 46, 'CX', 'Christmas Island', 'AUD', 'Australian Dollar', '36 ', '$', 45),
  ( 56, 'CY', 'Cyprus', 'CYP', 'Cyprus Pound', '196', NULL, 56),
  ( 57, 'CZ', 'Czech Republic', 'CZK', 'Czech Koruna', '203', 'Kč', 57),
  ( 81, 'DE', 'Germany', 'EUR', 'Euro', '978', '€', 82),
  ( 59, 'DJ', 'Djibouti', 'DJF', 'Djibouti Franc', '262', NULL, 59),
  ( 58, 'DK', 'Denmark', 'DKK', 'Danish Krone', '208', 'kr', 58),
  ( 60, 'DM', 'Dominica', 'XCD', 'East Caribbean Dollar', '951', '$', 60),
  ( 61, 'DO', 'Dominican Republic', 'DOP', 'Dominican Peso', '214', 'RD$', 61),
  (  3, 'DZ', 'Algeria', 'DZD', 'Algerian Dinar', '12 ', NULL, 3),
  ( 63, 'EC', 'Ecuador', 'USD', 'US Dollar', '840', '$', 63),
  ( 68, 'EE', 'Estonia', 'EEK', 'Kroon', '233', NULL, 68),
  ( 64, 'EG', 'Egypt', 'EGP', 'Egyptian Pound', '818', '£', 64),
  (239, 'EH', 'Western Sahara', 'MAD', 'Moroccan Dirham', '504', NULL, 236),
  ( 67, 'ER', 'Eritrea', 'ERN', 'Nakfa', '232', NULL, 67),
  (202, 'ES', 'Spain', 'EUR', 'Euro', '978', '€', 197),
  ( 69, 'ET', 'Ethiopia', 'ETB', 'Ethiopian Birr', '230', NULL, 69),
  ( 73, 'FI', 'Finland', 'EUR', 'Euro', '978', '€', 73),
  ( 72, 'FJ', 'Fiji', 'FJD', 'Fiji Dollar', '242', '$', 72),
  ( 70, 'FK', 'Falkland Islands (Malvinas)', 'FKP', 'Falkland Islands Pound', '238', '£', 70),
  (141, 'FM', 'Micronesia, Federated States Of', 'USD', 'US Dollar', '840', '$', 140),
  ( 71, 'FO', 'Faroe Islands', 'DKK', 'Danish Krone', '208', 'kr', 71),
  ( 74, 'FR', 'France', 'EUR', 'Euro', '978', '€', 74),
  ( 78, 'GA', 'Gabon', 'XAF', 'CFA Franc BEAC', '950', NULL, 79),
  ( 86, 'GD', 'Grenada', 'XCD', 'East Caribbean Dollar', '951', '$', 87),
  ( 80, 'GE', 'Georgia', 'GEL', 'Lari', '981', NULL, 81),
  ( 75, 'GF', 'French Guiana', 'EUR', 'Euro', '978', '€', 76),
  ( 82, 'GH', 'Ghana', 'GHC', 'Cedi', '288', '¢', 83),
  ( 83, 'GI', 'Gibraltar', 'GIP', 'Gibraltar Pound', '292', '£', 84),
  ( 85, 'GL', 'Greenland', 'DKK', 'Danish Krone', '208', 'kr', 86),
  ( 79, 'GM', 'Gambia', 'GMD', 'Dalasi', '270', NULL, 80),
  ( 90, 'GN', 'Guinea', 'GNF', 'Guinea Franc', '324', NULL, 91),
  ( 87, 'GP', 'Guadeloupe', 'EUR', 'Euro', '978', '€', 88),
  ( 66, 'GQ', 'Equatorial Guinea', 'XAF', 'CFA Franc BEAC', '950', NULL, 66),
  ( 84, 'GR', 'Greece', 'EUR', 'Euro', '978', '€', 85),
  (201, 'GS', 'South Georgia And The South Sandwich Islands ', 'GBP', 'Pound Sterling', '826', '£', 196),
  ( 89, 'GT', 'Guatemala', 'GTQ', 'Quetzal', '320', 'Q', 90),
  ( 88, 'GU', 'Guam', 'USD', 'US Dollar', '840', '$', 89),
  ( 91, 'GW', 'Guinea-Bissau', 'XOF', 'CFA Franc BCEAO', '952', NULL, 92),
  ( 92, 'GY', 'Guyana', 'GYD', 'Guyana Dollar', '328', '$', 93),
  ( 97, 'HK', 'Hong Kong', 'HKD', 'Hong Kong Dollar', '344', '$', 97),
  ( 94, 'HM', 'Heard Island And Mcdonald Islands', 'AUD', 'Australian Dollar', '36 ', '$', 95),
  ( 96, 'HN', 'Honduras', 'HNL', 'Lempira', '340', 'L', 96),
  ( 54, 'HR', 'Croatia', 'HRK', 'Croatian Kuna', '191', 'kn', 54),
  ( 93, 'HT', 'Haiti', 'HTG', 'Gourde', '332', NULL, 94),
  ( 98, 'HU', 'Hungary', 'HUF', 'Forint', '348', 'Ft', 98),
  (101, 'ID', 'Indonesia', 'IDR', 'Indonesia Rupiah', '360', 'Rp', 101),
  (104, 'IE', 'Ireland', 'EUR', 'Euro', '978', '€', 104),
  (105, 'IL', 'Israel', 'ILS', 'New Israeli Sheqel', '376', '₪', 105),
  (100, 'IN', 'India', 'INR', 'Indian Rupee', '356', '₹', 100),
  ( 31, 'IO', 'British Indian Ocean Territory', 'USD', 'US Dollar', '840', '$', 31),
  (103, 'IQ', 'Iraq', 'IQD', 'Iraqi Dinar', '368', NULL, 103),
  (102, 'IR', 'Iran', 'IRR', 'Iranian Rial', '364', NULL, 102),
  ( 99, 'IS', 'Iceland', 'ISK', 'Iceland Krona', '352', 'kr', 99),
  (106, 'IT', 'Italy', 'EUR', 'Euro', '978', '€', 106),
  (108, 'JM', 'Jamaica', 'JMD', 'Jamaican Dollar', '388', '$', 107),
  (110, 'JO', 'Jordan', 'JOD', 'Jordanian Dinar', '400', NULL, 109),
  (109, 'JP', 'Japan', 'JPY', 'Yen', '392', '¥', 108),
  (112, 'KE', 'Kenya', 'KES', 'Kenyan Shilling', '404', NULL, 111),
  (117, 'KG', 'Kyrgyzstan', 'KGS', 'Som', '417', 'лв', 116),
  ( 37, 'KH', 'Cambodia', 'KHR', 'Riel', '116', '៛', 36),
  (113, 'KI', 'Kiribati', 'AUD', 'Australian Dollar', '36 ', '$', 112),
  ( 49, 'KM', 'Comoros', 'KMF', 'Comoro Franc', '174', NULL, 48),
  (183, 'KN', 'Saint Kitts And Nevis', 'XCD', 'East Caribbean Dollar', '951', '$', 180),
  (114, 'KP', 'Korea, Democratic Peoples Republic Of', 'KPW', 'North Korean Won', '408', '₩', 113),
  (115, 'KR', 'Korea, Republic Of', 'KRW', 'South Korean Won', '410', '₩', 114),
  (116, 'KW', 'Kuwait', 'KWD', 'Kuwaiti Dinar', '414', NULL, 115),
  ( 41, 'KY', 'Cayman Islands', 'KYD', 'Cayman Islands Dollar', '136', '$', 40),
  (111, 'KZ', 'Kazakhstan', 'KZT', 'Tenge', '398', 'лв', 110),
  (118, 'LA', 'Laos', 'LAK', 'Kip', '418', '₭', 117),
  (120, 'LB', 'Lebanon', 'LBP', 'Lebanese Pound', '422', '£', 119),
  (184, 'LC', 'Saint Lucia', 'XCD', 'East Caribbean Dollar', '951', '$', 181),
  (124, 'LI', 'Liechtenstein', 'CHF', 'Swiss Franc', '756', NULL, 123),
  (203, 'LK', 'Sri Lanka', 'LKR', 'Sri Lanka Rupee', '144', '₨', 198),
  (122, 'LR', 'Liberia', 'LRD', 'Liberian Dollar', '430', '$', 121),
  (121, 'LS', 'Lesotho', 'LSL', 'Loti', '426', NULL, 120),
  (125, 'LT', 'Lithuania', 'LTL', 'Lithuanian Litas', '440', NULL, 124),
  (126, 'LU', 'Luxembourg', 'EUR', 'Euro', '978', '€', 125),
  (119, 'LV', 'Latvia', 'LVL', 'Latvian Lats', '428', NULL, 118),
  (123, 'LY', 'Libyan Arab Jamahiriya', 'LYD', 'Libyan Dinar', '434', NULL, 122),
  (147, 'MA', 'Morocco', 'MAD', 'Moroccan Dirham', '504', NULL, 145),
  (143, 'MC', 'Monaco', 'EUR', 'Euro', '978', '€', 142),
  (142, 'MD', 'Moldova', 'MDL', 'Moldovan Leu', '498', NULL, 141),
  (145, 'ME', 'Montenegro', 'EUR', 'Euro', '978', '€', 241),
  (129, 'MG', 'Madagascar', 'MGA', 'Malagascy Ariary', '969', NULL, 128),
  (135, 'MH', 'Marshall Islands',                       'USD', 'US Dollar', '840', '$',   134),
  (128, 'MK', 'Macedonia, Former Yugoslav Republic Of', 'MKD', 'Denar',     '807',  NULL, 127),
  (133, 'ML', 'Mali', 'XOF', 'CFA Franc BCEAO', '952', NULL, 132),
  (149, 'MM', 'Myanmar', 'MMK', 'Kyat', '104', NULL, 147),
  (144, 'MN', 'Mongolia', 'MNT', 'Tugrik', '496', '₮', 143),
  (127, 'MO', 'Macao', 'MOP', 'Pataca', '446', NULL, 126),
  (162, 'MP', 'Northern Mariana Islands', 'USD', 'US Dollar', '840', '$', 160),
  (136, 'MQ', 'Martinique', 'EUR', 'Euro', '978', '€', 135),
  (137, 'MR', 'Mauritania', 'MRO', 'Ouguiya', '478', NULL, 136),
  (146, 'MS', 'Montserrat', 'XCD', 'East Caribbean Dollar', '951', '$', 144),
  (134, 'MT', 'Malta', 'MTL', 'Maltese Lira', '470', NULL, 133),
  (138, 'MU', 'Mauritius', 'MUR', 'Mauritius Rupee', '480', '₨', 137),
  (132, 'MV', 'Maldives', 'MVR', 'Rufiyaa', '462', NULL, 131),
  (130, 'MW', 'Malawi', 'MWK', 'Malawi Kwacha', '454', NULL, 129),
  (140, 'MX', 'Mexico', 'MXN', 'Mexican Peso', '484', '$', 139),
  (131, 'MY', 'Malaysia', 'MYR', 'Malaysian Ringgit', '458', 'RM', 130),
  (148, 'MZ', 'Mozambique', 'MZN', 'Metical', '943', 'MT', 146),
  (150, 'NA', 'Namibia', 'NAD', 'Namibian Dollar', '516', '$', 148),
  (155, 'NC', 'New Caledonia', 'XPF', 'CFP Franc', '953', NULL, 153),
  (158, 'NE', 'Niger', 'XOF', 'CFA Franc BCEAO', '952', NULL, 156),
  (161, 'NF', 'Norfolk Island', 'AUD', 'Australian Dollar', '36 ', '$', 159),
  (159, 'NG', 'Nigeria', 'NGN', 'Naira', '566', '₦', 157),
  (157, 'NI', 'Nicaragua', 'NIO', 'Cordoba Oro', '558', 'C$', 155),
  (153, 'NL', 'Netherlands', 'EUR', 'Euro', '978', '€', 151),
  (163, 'NO', 'Norway', 'NOK', 'Norwegian Krone', '578', 'kr', 161),
  (152, 'NP', 'Nepal', 'NPR', 'Nepalese Rupee', '524', '₨', 150),
  (151, 'NR', 'Nauru', 'AUD', 'Australian Dollar', '36 ', '$', 149),
  (160, 'NU', 'Niue', 'NZD', 'New Zealand Dollar', '554', '$', 158),
  (156, 'NZ', 'New Zealand', 'NZD', 'New Zealand Dollar', '554', '$', 154),
  (164, 'OM', 'Oman', 'OMR', 'Rial Omani', '512', NULL, 162),
  (168, 'PA', 'Panama', 'PAB', 'Balboa', '590', 'B/.', 166),
  (171, 'PE', 'Peru', 'PEN', 'Nuevo Sol', '604', 'S/.', 169),
  ( 76, 'PF', 'French Polynesia', 'XPF', 'CFP Franc', '953', NULL, 77),
  (169, 'PG', 'Papua New Guinea', 'PGK', 'Kina', '598', NULL, 167),
  (172, 'PH', 'Philippines', 'PHP', 'Philippine Peso', '608', '₱', 170),
  (165, 'PK', 'Pakistan', 'PKR', 'Pakistan Rupee', '586', '₨', 163),
  (174, 'PL', 'Poland', 'PLN', 'Zloty', '985', 'zł', 172),
  (185, 'PM', 'Saint Pierre And Miquelon', 'EUR', 'Euro', '978', '€', 200),
  (173, 'PN', 'Pitcairn', 'NZD', 'New Zealand Dollar', '554', '$', 171),
  (176, 'PR', 'Puerto Rico', 'USD', 'US Dollar', '840', '$', 174),
  (167, 'PS', 'Palestinian Territories', NULL, NULL, NULL, NULL, 165),
  (175, 'PT', 'Portugal', 'EUR', 'Euro', '978', '€', 173),
  (166, 'PW', 'Palau', 'USD', 'US Dollar', '840', '$', 164),
  (170, 'PY', 'Paraguay', 'PYG', 'Guarani', '600', 'Gs', 168),
  (177, 'QA', 'Qatar', 'QAR', 'Qatari Rial', '634', NULL, 175),
  (178, 'RE', 'Reunion', 'EUR', 'Euro', '978', '€', 176),
  (179, 'RO', 'Romania', 'RON', 'New Leu', '946', 'lei', 177),
  (192, 'RS', 'Serbia', 'RSD', 'Serbian Dinar', '941', 'Дин.', 241),
  (180, 'RU', 'Russian Federation', 'RUB', 'Russian Ruble', '643', 'руб', 178),
  (181, 'RW', 'Rwanda', 'RWF', 'Rwanda Franc', '646', NULL, 179),
  (190, 'SA', 'Saudi Arabia', 'SAR', 'Saudi Riyal', '682', NULL, 186),
  (198, 'SB', 'Solomon Islands', 'SBD', 'Solomon Islands Dollar', '90 ', '$', 193),
  (193, 'SC', 'Seychelles', 'SCR', 'Seychelles Rupee', '690', '₨', 188),
  (204, 'SD', 'Sudan', 'SDD', 'Sudanese Dinar', '736', NULL, 201),
  (208, 'SE', 'Sweden', 'SEK', 'Swedish Krona', '752', 'kr', 205),
  (195, 'SG', 'Singapore', 'SGD', 'Singapore Dollar', '702', '$', 190),
  (182, 'SH', 'Saint Helena', 'SHP', 'Saint Helena Pound', '654', '£', 199),
  (197, 'SI', 'Slovenia', 'SIT', 'Tolar', '705', NULL, 192),
  (206, 'SJ', 'Svalbard And Jan Mayen', 'NOK', 'Norwegian Krone', '578', 'kr', 203),
  (196, 'SK', 'Slovakia', 'SKK', 'Slovak Koruna', '703', NULL, 191),
  (194, 'SL', 'Sierra Leone', 'SLL', 'Leone', '694', NULL, 189),
  (188, 'SM', 'San Marino', 'EUR', 'Euro', '978', '€', 184),
  (191, 'SN', 'Senegal', 'XOF', 'CFA Franc BCEAO', '952', NULL, 187),
  (199, 'SO', 'Somalia', 'SOS', 'Somali Shilling', '706', 'S', 194),
  (205, 'SR', 'Suriname', 'SRD', 'Surinam Dollar', '968', '$', 202),
  (189, 'ST', 'Sao Tome And Principe', 'STD', 'Dobra', '678', NULL, 185),
  ( 65, 'SV', 'El Salvador', 'SVC', 'El Salvador Colon', '222', '$', 65),
  (210, 'SY', 'Syria', 'SYP', 'Syrian Pound', '760', '£', 207),
  (207, 'SZ', 'Swaziland', 'SZL', 'Lilangeni', '748', NULL, 204),
  (224, 'TC', 'Turks And Caicos Islands', 'USD', 'US Dollar', '840', '$', 219),
  ( 43, 'TD', 'Chad', 'XAF', 'CFA Franc BEAC', '950', NULL, 42),
  ( 77, 'TF', 'French Southern Territories', 'EUR', 'Euro', '978', '€', 78),
  (217, 'TG', 'Togo', 'XOF', 'CFA Franc BCEAO', '952', NULL, 212),
  (215, 'TH', 'Thailand', 'THB', 'Baht', '764', '฿', 211),
  (212, 'TJ', 'Tajikistan', 'TJS', 'Somoni', '972', NULL, 209),
  (218, 'TK', 'Tokelau', 'NZD', 'New Zealand Dollar', '554', '$', 213),
  (216, 'TL', 'Timor-Leste', 'USD', 'US Dollar', '840', '$', 62),
  (223, 'TM', 'Turkmenistan', 'TMM', 'Turkmenistan Manat', '795', NULL, 218),
  (221, 'TN', 'Tunisia', 'TND', 'Tunisian Dinar', '788', NULL, 216),
  (219, 'TO', 'Tonga', 'TOP', 'Paanga', '776', NULL, 214),
  ( 62, 'TP', 'East Timor', 'IDR', 'Indonesia Rupiah', '360', 'Rp', 62),
  (222, 'TR', 'Turkey', 'TRY', 'New Turkish Lira', '949', '₺', 217),
  (220, 'TT', 'Trinidad And Tobago', 'TTD', 'Trinidad and Tobago Dollar', '780', '$', 215),
  (225, 'TV', 'Tuvalu', 'AUD', 'Australian Dollar', '36 ', '$', 220),
  (211, 'TW', 'Taiwan', 'TWD', 'New Taiwan Dollar', '901', '$', 208),
  (213, 'TZ', 'Tanzania', 'TZS', 'Tanzanian Shilling', '834', NULL, 210),
  (227, 'UA', 'Ukraine', 'UAH', 'Hryvnia', '980', '₴', 222),
  (226, 'UG', 'Uganda', 'UGX', 'Uganda Shilling', '800', NULL, 221),
  (229, 'UK', 'United Kingdom', 'GBP', 'Pound Sterling', '826', '£', 224),
  (232, 'UM', 'U.S. Minor Outlying Islands', 'USD', 'US Dollar', '840', '$', 226),
  (230, 'US', 'United States', 'USD', 'US Dollar', '840', '$', 225),
  (231, 'UY', 'Uruguay', 'UYU', 'Peso Uruguayo', '858', '$U', 227),
  (234, 'UZ', 'Uzbekistan', 'UZS', 'Uzbekistan Sum', '860', 'лв', 228),
  ( 95, 'VA', 'Holy See (Vatican City State)', 'EUR', 'Euro', '978', '€', 230),
  (186, 'VC', 'Saint Vincent And The Grenadines', 'XCD', 'East Caribbean Dollar', '951', '$', 182),
  (236, 'VE', 'Venezuela', 'VEB', 'Bolivar', '862', 'BS', 231),
  ( 32, 'VG', 'British Virgin Islands', 'USD', 'US Dollar', '840', '$', 233),
  (233, 'VI', 'U.S. Virgin Islands', 'USD', 'US Dollar', '840', '$', 234),
  (237, 'VN', 'Viet Nam', 'VND', 'Dong', '704', '₫', 232),
  (235, 'VU', 'Vanuatu', 'VUV', 'Vatu', '548', NULL, 229),
  (238, 'WF', 'Wallis And Futuna', 'XPF', 'CFP Franc', '953', NULL, 235),
  (187, 'WS', 'Samoa', 'WST', 'Tala', '882', NULL, 183),
  (240, 'YE', 'Yemen', 'YER', 'Yemeni Rial', '886', NULL, 237),
  (139, 'YT', 'Mayotte', 'EUR', 'Euro', '978', '€', 138),
  (200, 'ZA', 'South Africa', 'ZAR', 'Rand', '710', 'R', 195),
  (241, 'ZM', 'Zambia', 'ZMK', 'Zambian Kwacha', '894', NULL, 239),
  (242, 'ZW', 'Zimbabwe', 'ZWD', 'Zimbabwe Dollar', '716', '$', 240);

ALTER TABLE country ENABLE TRIGGER ALL;

--
-- Data for Name: curr_rate; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE curr_rate DISABLE TRIGGER ALL;

INSERT INTO curr_rate (curr_rate_id, curr_id, curr_rate, curr_effective, curr_expires) VALUES (2, 2, 1.00000000, '1970-01-01', '2100-01-01');

ALTER TABLE curr_rate ENABLE TRIGGER ALL;

--
-- Dependencies: 549
-- Name: cust_serial_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
-- This sequence is not used by a SERIAL column

SELECT pg_catalog.setval('cust_serial_seq', 1, false);

--
-- Data for Name: evnttype; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE evnttype DISABLE TRIGGER ALL;

INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (1, 'WoDueDateChanged', 'Work Order Due Date Changed', 'W/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (2, 'WoQtyChanged', 'Work Order Qty. Changed', 'W/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (3, 'WoCreated', 'Work Order Created', 'W/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (4, 'QOHBelowZero', 'QOH Dropped to a Negative Value', 'I/M');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (5, 'RWoDueDateRequestChange', 'Request to Change Released Due Date', 'W/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (6, 'RWoQtyRequestChange', 'Request to Change Released W/O Qty.', 'W/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (7, 'RWoRequestCancel', 'Request to Cancel Released W/O', 'W/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (8, 'WoCancelled', 'Work Order Canceled', 'W/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (9, 'CannotDistributeTransToGL', 'Cannot Distribute an Inventory Transaction to the G/L', 'G/L');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (10, 'SoitemQtyChanged', 'Sales Order Qty. Changed', 'S/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (11, 'SoitemCreated', 'Sales Order Item Added', 'S/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (12, 'SoitemSchedDateChanged', 'Sales Order Item Ship Date Changed', 'S/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (13, 'SoitemCancelled', 'Sales Order Item Cancelled', 'S/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (14, 'SoReleased', 'Sales Order Released', 'S/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (33, 'POitemCreate', 'Purchase Order Purchased Item Line Added', 'P/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (16, 'CannotConvertQuote', 'Cannot Convert a Quote to a Sales Order', 'S/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (17, 'DetachCCPayFromSO', 'Detached Credit Card payment from S/O', 'S/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (18, 'WODoubleClockIn', 'User clocked in to a Work Order without having previously clocked out', 'W/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (19, 'WODoubleClockOut', 'User clocked out of a Work Order without having previously clocked in', 'W/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (20, 'WOClockInOnClosedJob', 'User clocked in to a closed Work Order', 'W/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (21, 'WOClockOutWNoClockIn', 'User clocked out of a Work Order on which s/he was not clocked in', 'W/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (22, 'NewIncident', 'New Incident Created', 'CRM');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (23, 'UpdatedIncident', 'Incident Modified', 'CRM');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (24, 'ClosedIncident', 'Incident Closed', 'CRM');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (25, 'ReopenedIncident', 'Incident Which had been closed previously is being reopened', 'CRM');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (27, 'ToitemCreated', 'Transfer Order Item Created', 'I/M');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (29, 'ToitemQtyChanged', 'Transfer Order Item Qty. Changed', 'I/M');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (30, 'ToitemSchedDateChanged', 'Transfer Order Item Ship Date Changed', 'I/M');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (31, 'ToitemNoDestItemSite', 'Transfer Order Item created without an Item Site at the Destination Warehouse.', 'I/M');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (32, 'ToitemNoTransitItemSite', 'Transfer Order Item created without an Item Site at the Transit Warehouse.', 'I/M');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (28, 'ToitemCancelled', 'Transfer Order Item Cancelled', 'I/M');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (15, 'SoNotesChanged', 'Sales Order Order Comments Changed', 'S/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (34, 'TodoAlarm', 'To-Do Item Alarm', 'CRM');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (35, 'IncidentAlarm', 'Incident Alarm', 'CRM');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (36, 'TaskAlarm', 'Project Task Alarm', 'CRM');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (37, 'CostExceedsMaxDesired', 'Cost Exceeds Max Desired', 'P/D');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (38, 'PoItemCreatedBySo', 'Purchase Order Item Created by a Sales Order', 'P/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (39, 'PoItemUpdatedBySo', 'Purchase Order Item Updated by a Sales Order', 'P/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (40, 'PoItemSoCancelled', 'The Sales Order item has been cancelled for a linked Purchase Item', 'P/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (41, 'PoItemDropShipped', 'A Purchase Order Item has been Drop Shipped', 'P/O');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (42, 'CashReceiptPosted', 'A Cash Receipt has been posted', 'G/L');
INSERT INTO evnttype (evnttype_id, evnttype_name, evnttype_descrip, evnttype_module) VALUES (45, 'NewCustomer', 'A new Customer has been created', 'S/O');

ALTER TABLE evnttype ENABLE TRIGGER ALL;

--
-- Data for Name: flcol; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE flcol DISABLE TRIGGER ALL;

INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (1, 6, 'Current', 'Current Month', 335, true, false, false, false, true, 'P', false, false, 'N', false, false, false, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (2, 6, 'Current, Budget', 'Current to Budget', 336, true, false, false, false, false, 'P', false, false, 'N', false, false, false, true, false, true, true);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (3, 6, 'Current, Prior Month', 'Current to Prior Month End', 337, true, false, false, false, false, 'P', true, false, 'N', false, true, true, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (4, 6, 'Current, Prior Quarter', 'Current to Prior Quarter End', 346, true, false, false, false, false, 'P', false, true, 'N', false, true, true, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (5, 6, 'Current, Prior Year', 'Current to Prior Year End', 338, true, false, false, false, false, 'P', false, false, 'F', false, true, true, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (6, 6, 'Current, Year Ago', 'Current to Month Prior Year', 337, true, false, false, false, false, 'Y', true, false, 'N', false, true, true, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (7, 7, 'Month', 'Current Month', 335, true, false, false, false, true, 'P', false, false, 'N', false, false, false, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (8, 7, 'Month, Budget', 'Current Month to Budget', 336, true, false, false, false, false, 'P', false, false, 'N', false, false, false, true, false, true, true);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (9, 7, 'Month, Prior Month', 'Current Month to Prior Month', 337, true, false, false, false, false, 'P', true, false, 'N', false, true, true, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (10, 7, 'Month, YTD', 'Month and Year to Date', 334, true, false, true, false, true, 'P', false, false, 'N', false, false, false, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (11, 7, 'Month, QTD', 'Month and Quarter to Date', 339, true, true, false, false, true, 'P', false, false, 'N', false, false, false, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (12, 7, 'QTD, Budget', 'Quarter to Date to Budget', 341, false, true, false, false, false, 'P', false, false, 'N', false, false, false, true, false, true, true);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (13, 7, 'QTD, Prior Quarter', 'Quarter to Date to Prior Quarter', 342, false, true, false, false, false, 'P', false, true, 'N', false, true, true, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (14, 7, 'YTD', 'Year To Date', 343, false, false, true, false, true, 'P', false, false, 'N', false, false, false, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (15, 7, 'YTD, Budget', 'Year to Date to Budget', 344, false, false, true, false, false, 'P', false, false, 'N', false, false, false, true, false, true, true);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (16, 7, 'YTD, Prior Full Year', 'Year to Date to Prior Full Year', 345, false, false, true, false, false, 'P', false, false, 'F', false, true, true, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (17, 7, 'Month, Prior Year Month', 'Current Month to Same Month Prior Year', 337, true, false, false, false, false, 'Y', true, false, 'N', false, true, true, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (19, 7, 'YTD, Prior Year YTD', 'Year to Date to Year to Date Prior Year', 345, false, false, true, false, false, 'P', false, false, 'D', false, true, true, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (20, 7, 'QTD', 'Quarter to Date', 340, false, true, false, false, true, 'P', false, false, 'N', false, false, false, false, false, false, false);
INSERT INTO flcol (flcol_id, flcol_flhead_id, flcol_name, flcol_descrip, flcol_report_id, flcol_month, flcol_quarter, flcol_year, flcol_showdb, flcol_prcnt, flcol_priortype, flcol_priormonth, flcol_priorquarter, flcol_prioryear, flcol_priorprcnt, flcol_priordiff, flcol_priordiffprcnt, flcol_budget, flcol_budgetprcnt, flcol_budgetdiff, flcol_budgetdiffprcnt) VALUES (18, 7, 'QTD, Prior Year Quarter', 'Quarter to Date to Same Quarter Prior Year', 342, false, true, false, false, false, 'Y', false, true, 'N', false, true, true, false, false, false, false);

ALTER TABLE flcol ENABLE TRIGGER ALL;

--
-- Data for Name: flgrp; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE flgrp DISABLE TRIGGER ALL;

INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (2, 3, -1, 1, 'Revenue', 'Revenue', true, false, false, false, true, false, true, false, true, false, true, 3, true, true, true, true, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (3, 3, 2, 1, 'Sales', 'Sales', true, false, false, false, true, false, false, false, false, false, false, 3, true, true, true, true, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (4, 3, 2, 2, 'Cost of Goods Sold', 'Cost of Goods Sold', false, false, false, false, false, false, false, false, false, false, false, 3, false, false, false, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (5, 3, 2, 3, 'Gross Margin on Sales....................', 'Gross Margin on Sales....................', false, false, false, false, false, false, false, false, false, false, false, 3, false, false, false, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (6, 3, -1, 2, 'Expenses', 'Expenses', false, false, true, false, false, false, false, false, false, false, false, 3, false, false, false, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (7, 3, 6, 1, 'Expenses', 'Expenses', true, false, false, false, true, false, true, false, true, false, true, 3, true, true, true, true, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (8, 3, -1, 3, 'Net Income..............................', 'Net Income..............................', false, false, false, false, false, false, false, false, false, false, false, 3, false, false, false, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (9, 4, -1, 2, 'Liabilities and Owner''s Equity', 'Liabilities and Owner''s Equity', true, false, true, false, true, false, false, false, false, false, false, -1, false, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (10, 4, 9, 1, 'Liabilities', 'Liabilities', true, false, false, false, true, false, false, false, false, false, false, -1, false, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (11, 4, 10, 1, 'Current Liabilities', 'Current Liabilities', true, false, false, false, true, false, false, false, false, false, false, -1, false, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (12, 4, 10, 2, 'Long-Term Liabilities', 'Long-Term Liabilites', true, false, false, false, true, false, false, false, false, false, false, -1, false, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (13, 4, 9, 2, 'Owner''s Equity', 'Owner''s Equity', true, false, false, false, true, false, false, false, false, false, false, -1, false, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (14, 4, 13, 1, 'Shareholders'' Equity', 'Shareholders'' Equity', true, false, false, false, true, false, false, false, false, false, false, -1, false, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (15, 4, 13, 2, 'Profit / Loss', 'Profit / Loss', true, true, false, false, true, false, false, false, false, false, false, -1, false, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (16, 4, 13, 3, 'Retained Earnings', 'Retained Earnings', true, false, false, false, true, false, false, false, false, false, false, -1, false, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (17, 4, -1, 1, 'Assets', 'Assets', true, false, false, false, true, false, false, false, false, false, false, -1, false, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (18, 4, 17, 1, 'Current Assets', 'Current Assets', true, false, false, false, true, false, false, false, false, false, false, -1, false, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (19, 4, 17, 2, 'Fixed Assets', 'Fixed Assets', true, false, false, false, true, false, false, false, false, false, false, -1, false, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (20, 4, 17, 3, 'Other Assets', 'Other Assets', true, false, false, false, true, false, false, false, false, false, false, -1, false, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (21, 5, -1, 1, 'Cash Flows', 'Cash Flows', true, false, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (22, 5, 21, 1, 'Cash Flows from Operating Activities', 'Cash Flows from Operating Activities', true, false, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (23, 5, 22, 1, 'Cash Flows From Operating Activities', 'Cash Flows From Operating Activities', true, false, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (24, 5, 23, 1, 'Net Income', 'Net Income', false, true, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (25, 5, 22, 2, 'Charges Not Using Cash', 'Charges Not Using Cash', true, false, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (26, 5, 22, 3, 'Change in Current Assets', 'Change in Current Assets', false, false, true, false, false, false, false, false, false, false, false, -1, false, false, false, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (27, 5, 22, 4, 'Short-Term Investments', 'Short-Term Investments', true, false, true, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (28, 5, 22, 5, 'Net Receivables', 'Net Receivables', true, false, true, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (29, 5, 22, 6, 'Inventory', 'Inventory', true, false, true, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (30, 5, 22, 8, 'Change in Current Liabilities', 'Change in Current Liabilities', false, false, false, false, false, false, false, false, false, false, false, -1, false, false, false, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (31, 5, 22, 9, 'Accounts Payable', 'Accounts Payable', true, false, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (32, 5, 22, 7, 'Prepaid Expenses', 'Prepaid Expenses', true, false, true, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (33, 5, 22, 10, 'Notes Payable Current', 'Notes Payable Current', true, false, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (34, 5, 22, 11, 'Current Maturities on Long-Term Debt', 'Current Maturities on Long-Term Debt', true, false, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (35, 5, 22, 12, 'Taxes Payable', 'Tases Payable', true, false, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (36, 5, 22, 13, 'Other Current Liabilities', 'Other Current Liabilities', true, false, true, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (37, 5, 22, 14, 'Total Cash Flows from Operating Activities..........', 'Total Cash Flows from Operating Activities..........', false, false, false, false, false, false, false, false, false, false, false, -1, false, false, false, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (38, 5, 21, 2, 'Cash Flows from Investing Activities', 'Cash Flows from Investing Activities', true, false, true, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (39, 5, 38, 1, 'Property, Plant, and Equipment', 'Property, Plant, and Equipment', true, false, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (40, 5, 38, 2, 'Other Assets', 'Other Assets', true, false, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (41, 5, 38, 3, 'Total Cash Flows from Investing Activities..........', 'Total Cash Flows from Investing Activities..........', false, false, false, false, false, false, false, false, false, false, false, -1, false, false, false, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (42, 5, 21, 3, 'Cash Flows from Financing Activities', 'Cash Flows from Financing Activities', true, false, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (43, 5, 42, 1, 'Long-Term Debt', 'Long-Term Debt', true, false, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (44, 5, 42, 2, 'Common Stock and Equity', 'Common Stock and Equity', true, false, false, false, false, false, false, false, false, false, false, -1, true, false, true, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (45, 5, 42, 3, 'Total Cash Flows from Financing Activities..........', 'Total Cash Flows from Financing Activities..........', false, false, false, false, false, false, false, false, false, false, false, -1, false, false, false, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (46, 5, -1, 2, 'Cash Position', 'Cash Position', false, false, false, false, false, false, false, false, false, false, false, -1, false, false, false, false, false, NULL);
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (47, 6, -1, 1, 'ASSETS', 'ASSETS', true, false, false, false, true, false, true, false, false, false, false, -1, false, false, false, false, true, 'Total Assets');
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (48, 6, -1, 2, 'LIABILITIES AND OWNERS EQUITY', 'LIABILITIES AND OWNERS EQUITY', true, false, true, false, true, false, true, false, false, false, false, -1, false, false, false, false, true, 'Total Liabilities and Owners Equity');
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (49, 6, 48, 1, 'LIABILITIES', 'LIABILITIES', true, false, false, false, true, false, true, false, true, false, true, -1, false, false, false, false, true, 'Total Liabilities');
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (50, 6, 48, 2, 'OWNERS EQUITY', 'OWNERS EQUITY', true, false, false, false, true, false, true, false, true, false, true, -1, false, false, false, false, true, 'Total Owners Equity');
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (51, 6, 50, 2, 'Net Income', '', false, true, false, false, true, false, true, false, true, false, true, -1, false, false, false, false, false, '');
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (52, 7, -1, 1, 'INCOME', 'INCOME', true, false, false, false, false, false, true, false, false, false, false, -1, true, false, false, false, true, 'Net Income');
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (53, 7, 52, 2, 'REVENUE', 'REVENUE', true, false, false, false, false, false, true, false, false, false, false, -1, true, false, false, false, true, 'Total Net Revenue');
INSERT INTO flgrp (flgrp_id, flgrp_flhead_id, flgrp_flgrp_id, flgrp_order, flgrp_name, flgrp_descrip, flgrp_subtotal, flgrp_summarize, flgrp_subtract, flgrp_showstart, flgrp_showend, flgrp_showdelta, flgrp_showbudget, flgrp_showstartprcnt, flgrp_showendprcnt, flgrp_showdeltaprcnt, flgrp_showbudgetprcnt, flgrp_prcnt_flgrp_id, flgrp_showdiff, flgrp_showdiffprcnt, flgrp_showcustom, flgrp_showcustomprcnt, flgrp_usealtsubtotal, flgrp_altsubtotal) VALUES (54, 7, 52, 3, 'EXPENSES', 'EXPENSES', true, false, true, false, false, false, true, false, false, false, false, -1, true, false, false, false, true, 'Total Net Expenses');

ALTER TABLE flgrp ENABLE TRIGGER ALL;

--
-- Data for Name: flhead; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE flhead DISABLE TRIGGER ALL;

INSERT INTO flhead (flhead_id, flhead_name, flhead_descrip, flhead_showtotal, flhead_showstart, flhead_showend, flhead_showdelta, flhead_showbudget, flhead_showdiff, flhead_showcustom, flhead_custom_label, flhead_usealttotal, flhead_alttotal, flhead_usealtbegin, flhead_altbegin, flhead_usealtend, flhead_altend, flhead_usealtdebits, flhead_altdebits, flhead_usealtcredits, flhead_altcredits, flhead_usealtbudget, flhead_altbudget, flhead_usealtdiff, flhead_altdiff, flhead_type, flhead_active, flhead_sys, flhead_notes) VALUES (3, 'Income Statement (OpenMFG)', 'Income Statement Template', true, true, true, false, true, true, true, 'Statement', false, NULL, false, NULL, false, NULL, false, NULL, false, NULL, false, NULL, false, NULL, 'A', true, false, '');
INSERT INTO flhead (flhead_id, flhead_name, flhead_descrip, flhead_showtotal, flhead_showstart, flhead_showend, flhead_showdelta, flhead_showbudget, flhead_showdiff, flhead_showcustom, flhead_custom_label, flhead_usealttotal, flhead_alttotal, flhead_usealtbegin, flhead_altbegin, flhead_usealtend, flhead_altend, flhead_usealtdebits, flhead_altdebits, flhead_usealtcredits, flhead_altcredits, flhead_usealtbudget, flhead_altbudget, flhead_usealtdiff, flhead_altdiff, flhead_type, flhead_active, flhead_sys, flhead_notes) VALUES (4, 'Balance Sheet (OpenMFG)', 'Balance Sheet Template', true, false, true, false, false, false, true, 'Statement', false, NULL, false, NULL, false, NULL, false, NULL, false, NULL, false, NULL, false, NULL, 'A', true, false, '');
INSERT INTO flhead (flhead_id, flhead_name, flhead_descrip, flhead_showtotal, flhead_showstart, flhead_showend, flhead_showdelta, flhead_showbudget, flhead_showdiff, flhead_showcustom, flhead_custom_label, flhead_usealttotal, flhead_alttotal, flhead_usealtbegin, flhead_altbegin, flhead_usealtend, flhead_altend, flhead_usealtdebits, flhead_altdebits, flhead_usealtcredits, flhead_altcredits, flhead_usealtbudget, flhead_altbudget, flhead_usealtdiff, flhead_altdiff, flhead_type, flhead_active, flhead_sys, flhead_notes) VALUES (5, 'Statement of Cash Flows (OpenMFG)', 'Statement of Cash Flows Template', true, false, false, false, false, true, true, 'Statement', false, NULL, false, NULL, false, NULL, false, NULL, false, NULL, false, NULL, false, NULL, 'A', true, false, '');
INSERT INTO flhead (flhead_id, flhead_name, flhead_descrip, flhead_showtotal, flhead_showstart, flhead_showend, flhead_showdelta, flhead_showbudget, flhead_showdiff, flhead_showcustom, flhead_custom_label, flhead_usealttotal, flhead_alttotal, flhead_usealtbegin, flhead_altbegin, flhead_usealtend, flhead_altend, flhead_usealtdebits, flhead_altdebits, flhead_usealtcredits, flhead_altcredits, flhead_usealtbudget, flhead_altbudget, flhead_usealtdiff, flhead_altdiff, flhead_type, flhead_active, flhead_sys, flhead_notes) VALUES (6, 'Basic Balance Sheet', 'Balance Sheet Template', false, false, false, false, false, false, false, NULL, false, NULL, false, NULL, false, NULL, false, NULL, false, NULL, false, NULL, false, NULL, 'B', true, true, '');
INSERT INTO flhead (flhead_id, flhead_name, flhead_descrip, flhead_showtotal, flhead_showstart, flhead_showend, flhead_showdelta, flhead_showbudget, flhead_showdiff, flhead_showcustom, flhead_custom_label, flhead_usealttotal, flhead_alttotal, flhead_usealtbegin, flhead_altbegin, flhead_usealtend, flhead_altend, flhead_usealtdebits, flhead_altdebits, flhead_usealtcredits, flhead_altcredits, flhead_usealtbudget, flhead_altbudget, flhead_usealtdiff, flhead_altdiff, flhead_type, flhead_active, flhead_sys, flhead_notes) VALUES (7, 'Basic Income Statement', 'Income Statement Template', false, false, false, false, false, false, false, '', false, '', false, '', false, '', false, '', false, '', false, '', false, '', 'I', true, true, '');

ALTER TABLE flhead ENABLE TRIGGER ALL;

--
-- Data for Name: flitem; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE flitem DISABLE TRIGGER ALL;

INSERT INTO flitem (flitem_id, flitem_flhead_id, flitem_flgrp_id, flitem_order, flitem_accnt_id, flitem_showstart, flitem_showend, flitem_showdelta, flitem_showbudget, flitem_subtract, flitem_showstartprcnt, flitem_showendprcnt, flitem_showdeltaprcnt, flitem_showbudgetprcnt, flitem_prcnt_flgrp_id, flitem_showdiff, flitem_showdiffprcnt, flitem_showcustom, flitem_showcustomprcnt, flitem_custom_source, flitem_company, flitem_profit, flitem_number, flitem_sub, flitem_type, flitem_subaccnttype_code) VALUES (2, 6, 47, 1, -1, false, true, false, true, false, false, true, false, true, -1, true, false, false, false, 'S', 'All', 'All', 'All', 'All', 'A', 'All');
INSERT INTO flitem (flitem_id, flitem_flhead_id, flitem_flgrp_id, flitem_order, flitem_accnt_id, flitem_showstart, flitem_showend, flitem_showdelta, flitem_showbudget, flitem_subtract, flitem_showstartprcnt, flitem_showendprcnt, flitem_showdeltaprcnt, flitem_showbudgetprcnt, flitem_prcnt_flgrp_id, flitem_showdiff, flitem_showdiffprcnt, flitem_showcustom, flitem_showcustomprcnt, flitem_custom_source, flitem_company, flitem_profit, flitem_number, flitem_sub, flitem_type, flitem_subaccnttype_code) VALUES (3, 6, 49, 1, -1, false, true, false, true, false, false, true, false, true, -1, true, false, false, false, 'S', 'All', 'All', 'All', 'All', 'L', 'All');
INSERT INTO flitem (flitem_id, flitem_flhead_id, flitem_flgrp_id, flitem_order, flitem_accnt_id, flitem_showstart, flitem_showend, flitem_showdelta, flitem_showbudget, flitem_subtract, flitem_showstartprcnt, flitem_showendprcnt, flitem_showdeltaprcnt, flitem_showbudgetprcnt, flitem_prcnt_flgrp_id, flitem_showdiff, flitem_showdiffprcnt, flitem_showcustom, flitem_showcustomprcnt, flitem_custom_source, flitem_company, flitem_profit, flitem_number, flitem_sub, flitem_type, flitem_subaccnttype_code) VALUES (4, 6, 50, 1, -1, false, true, false, true, false, false, true, false, true, -1, true, false, false, false, 'S', 'All', 'All', 'All', 'All', 'Q', 'All');
INSERT INTO flitem (flitem_id, flitem_flhead_id, flitem_flgrp_id, flitem_order, flitem_accnt_id, flitem_showstart, flitem_showend, flitem_showdelta, flitem_showbudget, flitem_subtract, flitem_showstartprcnt, flitem_showendprcnt, flitem_showdeltaprcnt, flitem_showbudgetprcnt, flitem_prcnt_flgrp_id, flitem_showdiff, flitem_showdiffprcnt, flitem_showcustom, flitem_showcustomprcnt, flitem_custom_source, flitem_company, flitem_profit, flitem_number, flitem_sub, flitem_type, flitem_subaccnttype_code) VALUES (5, 6, 51, 1, -1, false, true, false, true, false, false, false, false, false, -1, true, false, false, false, 'S', 'All', 'All', 'All', 'All', 'R', 'All');
INSERT INTO flitem (flitem_id, flitem_flhead_id, flitem_flgrp_id, flitem_order, flitem_accnt_id, flitem_showstart, flitem_showend, flitem_showdelta, flitem_showbudget, flitem_subtract, flitem_showstartprcnt, flitem_showendprcnt, flitem_showdeltaprcnt, flitem_showbudgetprcnt, flitem_prcnt_flgrp_id, flitem_showdiff, flitem_showdiffprcnt, flitem_showcustom, flitem_showcustomprcnt, flitem_custom_source, flitem_company, flitem_profit, flitem_number, flitem_sub, flitem_type, flitem_subaccnttype_code) VALUES (6, 6, 51, 2, -1, false, true, false, true, true, false, false, false, false, -1, true, false, false, false, 'S', 'All', 'All', 'All', 'All', 'E', 'All');
INSERT INTO flitem (flitem_id, flitem_flhead_id, flitem_flgrp_id, flitem_order, flitem_accnt_id, flitem_showstart, flitem_showend, flitem_showdelta, flitem_showbudget, flitem_subtract, flitem_showstartprcnt, flitem_showendprcnt, flitem_showdeltaprcnt, flitem_showbudgetprcnt, flitem_prcnt_flgrp_id, flitem_showdiff, flitem_showdiffprcnt, flitem_showcustom, flitem_showcustomprcnt, flitem_custom_source, flitem_company, flitem_profit, flitem_number, flitem_sub, flitem_type, flitem_subaccnttype_code) VALUES (7, 7, 53, 1, -1, false, false, false, true, false, false, false, false, true, -1, true, true, false, false, 'S', 'All', 'All', 'All', 'All', 'R', 'All');
INSERT INTO flitem (flitem_id, flitem_flhead_id, flitem_flgrp_id, flitem_order, flitem_accnt_id, flitem_showstart, flitem_showend, flitem_showdelta, flitem_showbudget, flitem_subtract, flitem_showstartprcnt, flitem_showendprcnt, flitem_showdeltaprcnt, flitem_showbudgetprcnt, flitem_prcnt_flgrp_id, flitem_showdiff, flitem_showdiffprcnt, flitem_showcustom, flitem_showcustomprcnt, flitem_custom_source, flitem_company, flitem_profit, flitem_number, flitem_sub, flitem_type, flitem_subaccnttype_code) VALUES (8, 7, 54, 1, -1, false, false, false, true, false, false, false, false, true, -1, true, true, false, false, 'S', 'All', 'All', 'All', 'All', 'E', 'All');

ALTER TABLE flitem ENABLE TRIGGER ALL;

--
-- Dependencies: 600
-- Name: gltrans_sequence_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
-- This sequence is not used by a SERIAL column

SELECT pg_catalog.setval('gltrans_sequence_seq', 3583, true);

--
-- Data for Name: grp; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE grp DISABLE TRIGGER ALL;

INSERT INTO grp (grp_id, grp_name, grp_descrip) VALUES (1, 'ADMIN', 'Admin Users');


ALTER TABLE grp ENABLE TRIGGER ALL;

--
-- Data for Name: hnfc; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE hnfc DISABLE TRIGGER ALL;

INSERT INTO hnfc (hnfc_id, hnfc_code) VALUES (1, 'Dr');
INSERT INTO hnfc (hnfc_id, hnfc_code) VALUES (2, 'Miss');
INSERT INTO hnfc (hnfc_id, hnfc_code) VALUES (3, 'Mr');
INSERT INTO hnfc (hnfc_id, hnfc_code) VALUES (4, 'Mrs');
INSERT INTO hnfc (hnfc_id, hnfc_code) VALUES (5, 'Ms');

ALTER TABLE hnfc ENABLE TRIGGER ALL;

--
-- Data for Name: incdtresolution; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE incdtresolution DISABLE TRIGGER ALL;

INSERT INTO incdtresolution (incdtresolution_id, incdtresolution_name, incdtresolution_order, incdtresolution_descrip) VALUES (1, 'Fixed', 0, NULL);
INSERT INTO incdtresolution (incdtresolution_id, incdtresolution_name, incdtresolution_order, incdtresolution_descrip) VALUES (2, 'Duplicate', 1, NULL);
INSERT INTO incdtresolution (incdtresolution_id, incdtresolution_name, incdtresolution_order, incdtresolution_descrip) VALUES (3, 'Not Fixable', 2, NULL);
INSERT INTO incdtresolution (incdtresolution_id, incdtresolution_name, incdtresolution_order, incdtresolution_descrip) VALUES (4, 'Won''t Fix', 3, NULL);

ALTER TABLE incdtresolution ENABLE TRIGGER ALL;

--
-- Data for Name: incdtseverity; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE incdtseverity DISABLE TRIGGER ALL;

INSERT INTO incdtseverity (incdtseverity_id, incdtseverity_name, incdtseverity_order, incdtseverity_descrip) VALUES (1, 'Trivial', 0, NULL);
INSERT INTO incdtseverity (incdtseverity_id, incdtseverity_name, incdtseverity_order, incdtseverity_descrip) VALUES (2, 'Minor', 1, NULL);
INSERT INTO incdtseverity (incdtseverity_id, incdtseverity_name, incdtseverity_order, incdtseverity_descrip) VALUES (3, 'Normal', 2, NULL);
INSERT INTO incdtseverity (incdtseverity_id, incdtseverity_name, incdtseverity_order, incdtseverity_descrip) VALUES (4, 'Severe', 3, NULL);
INSERT INTO incdtseverity (incdtseverity_id, incdtseverity_name, incdtseverity_order, incdtseverity_descrip) VALUES (5, 'Critical', 4, NULL);

ALTER TABLE incdtseverity ENABLE TRIGGER ALL;


--
-- Dependencies: 642
-- Name: itemfrez_itemfrez_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
-- This sequence is not used by a SERIAL column

SELECT pg_catalog.setval('itemfrez_itemfrez_seq', 1, false);


--
-- Dependencies: 651
-- Name: itemloc_series_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
-- This sequence is not used by a SERIAL column

SELECT pg_catalog.setval('itemloc_series_seq', 1022, true);

--
-- Data for Name: uomtype; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE uomtype DISABLE TRIGGER ALL;

INSERT INTO uomtype (uomtype_id, uomtype_name, uomtype_descrip, uomtype_multiple) VALUES (1, 'Selling', 'Selling a.k.a. Pricing and Shipping UOMs.', true);
INSERT INTO uomtype (uomtype_id, uomtype_name, uomtype_descrip, uomtype_multiple) VALUES (2, 'Capacity', 'Capacity UOMs.', false);
INSERT INTO uomtype (uomtype_id, uomtype_name, uomtype_descrip, uomtype_multiple) VALUES (3, 'AltCapacity', 'Alternate Capacity UOMs.', false);
INSERT INTO uomtype (uomtype_id, uomtype_name, uomtype_descrip, uomtype_multiple) VALUES (4, 'MaterialIssue', 'Material Issuing UOMs.', false);

ALTER TABLE uomtype ENABLE TRIGGER ALL;

--
-- Dependencies: 667
-- Name: journal_number_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
-- This sequence is not used by a SERIAL column

SELECT pg_catalog.setval('journal_number_seq', 2274, true);

--
-- Data for Name: labeldef; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE labeldef DISABLE TRIGGER ALL;

INSERT INTO labeldef (labeldef_id, labeldef_name, labeldef_papersize, labeldef_columns, labeldef_rows, labeldef_width, labeldef_height, labeldef_start_offset_x, labeldef_start_offset_y, labeldef_horizontal_gap, labeldef_vertical_gap) VALUES (1, 'Avery 5263', 'Letter', 2, 5, 400, 200, 25, 50, 0, 0);
INSERT INTO labeldef (labeldef_id, labeldef_name, labeldef_papersize, labeldef_columns, labeldef_rows, labeldef_width, labeldef_height, labeldef_start_offset_x, labeldef_start_offset_y, labeldef_horizontal_gap, labeldef_vertical_gap) VALUES (2, 'Avery 5264', 'Letter', 2, 3, 400, 333, 25, 75, 0, 0);
INSERT INTO labeldef (labeldef_id, labeldef_name, labeldef_papersize, labeldef_columns, labeldef_rows, labeldef_width, labeldef_height, labeldef_start_offset_x, labeldef_start_offset_y, labeldef_horizontal_gap, labeldef_vertical_gap) VALUES (3, 'Avery 8460', 'Letter', 3, 10, 262, 100, 32, 50, 0, 0);
INSERT INTO labeldef (labeldef_id, labeldef_name, labeldef_papersize, labeldef_columns, labeldef_rows, labeldef_width, labeldef_height, labeldef_start_offset_x, labeldef_start_offset_y, labeldef_horizontal_gap, labeldef_vertical_gap) VALUES (4, 'CILS ALP1-9200-1', 'Letter', 3, 7, 200, 100, 62, 62, 81, 50);

ALTER TABLE labeldef ENABLE TRIGGER ALL;

--
-- Data for Name: lang; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE lang DISABLE TRIGGER ALL;

INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (1, 3, NULL, NULL, 'Afan');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (2, 156, NULL, NULL, 'Atsam');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (3, 16, NULL, NULL, 'Bhutani');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (4, 22, NULL, NULL, 'Byelorussian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (5, 23, NULL, NULL, 'Cambodian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (6, 158, NULL, NULL, 'Jju');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (7, 154, NULL, NULL, 'Koro');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (8, 68, NULL, NULL, 'Kurundi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (9, 69, NULL, NULL, 'Laothian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (10, 101, NULL, NULL, 'SerboCroatian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (11, 102, NULL, NULL, 'Sesotho');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (12, 103, NULL, NULL, 'Setswana');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (13, 107, NULL, NULL, 'Siswati');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (14, 164, NULL, NULL, 'Tyap');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (15, NULL, 'ace', NULL, 'Achinese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (16, NULL, 'ach', NULL, 'Acoli');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (17, NULL, 'ada', NULL, 'Adangme');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (18, NULL, 'ady', NULL, 'Adyghe; Adygei');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (19, NULL, 'afa', NULL, 'Afro-Asiatic.(Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (20, NULL, 'afh', NULL, 'Afrihili');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (21, NULL, 'ain', NULL, 'Ainu');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (22, NULL, 'akk', NULL, 'Akkadian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (23, NULL, 'ale', NULL, 'Aleut');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (24, NULL, 'alg', NULL, 'Algonquian languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (25, NULL, 'alt', NULL, 'Southern Altai');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (26, NULL, 'ang', NULL, 'English, Old (ca.450-1100)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (27, NULL, 'anp', NULL, 'Angika');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (28, NULL, 'apa', NULL, 'Apache languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (29, NULL, 'arc', NULL, 'Official Aramaic (700-300 BCE); Imperial Aramaic (700-300 BCE)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (30, NULL, 'arn', NULL, 'Mapudungun; Mapuche');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (31, NULL, 'arp', NULL, 'Arapaho');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (32, NULL, 'art', NULL, 'Artificial (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (33, NULL, 'arw', NULL, 'Arawak');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (34, NULL, 'ast', NULL, 'Asturian; Bable; Leonese; Asturleonese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (35, NULL, 'ath', NULL, 'Athapascan languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (36, NULL, 'aus', NULL, 'Australian languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (37, NULL, 'awa', NULL, 'Awadhi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (38, NULL, 'bad', NULL, 'Banda languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (39, NULL, 'bai', NULL, 'Bamileke languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (40, NULL, 'bal', NULL, 'Baluchi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (41, NULL, 'ban', NULL, 'Balinese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (42, NULL, 'bas', NULL, 'Basa');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (43, NULL, 'bat', NULL, 'Baltic (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (44, NULL, 'bej', NULL, 'Beja; Bedawiyet');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (45, NULL, 'bem', NULL, 'Bemba');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (46, NULL, 'ber', NULL, 'Berber (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (47, NULL, 'bho', NULL, 'Bhojpuri');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (48, NULL, 'bik', NULL, 'Bikol');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (49, NULL, 'bin', NULL, 'Bini; Edo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (50, NULL, 'bla', NULL, 'Siksika');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (51, NULL, 'bnt', NULL, 'Bantu (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (52, NULL, 'bra', NULL, 'Braj');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (53, NULL, 'btk', NULL, 'Batak languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (54, NULL, 'bua', NULL, 'Buriat');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (55, NULL, 'bug', NULL, 'Buginese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (56, 152, 'byn', NULL, 'Blin; Bilin');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (57, NULL, 'cad', NULL, 'Caddo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (58, NULL, 'cai', NULL, 'Central American Indian (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (59, NULL, 'car', NULL, 'Galibi Carib');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (60, NULL, 'cau', NULL, 'Caucasian (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (61, NULL, 'ceb', NULL, 'Cebuano');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (62, NULL, 'cel', NULL, 'Celtic (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (63, NULL, 'chb', NULL, 'Chibcha');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (64, NULL, 'chg', NULL, 'Chagatai');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (65, NULL, 'chk', NULL, 'Chuukese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (66, NULL, 'chm', NULL, 'Mari');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (67, NULL, 'chn', NULL, 'Chinook jargon');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (68, NULL, 'cho', NULL, 'Choctaw');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (69, NULL, 'chp', NULL, 'Chipewyan; Dene Suline');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (70, NULL, 'chr', NULL, 'Cherokee');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (71, NULL, 'chy', NULL, 'Cheyenne');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (72, NULL, 'cmc', NULL, 'Chamic languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (73, NULL, 'cop', NULL, 'Coptic');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (74, NULL, 'cpe', NULL, 'Creoles and pidgins, English-based (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (75, NULL, 'cpf', NULL, 'Creoles and pidgins, French-based (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (76, NULL, 'cpp', NULL, 'Creoles and pidgins, Portuguese-based (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (77, NULL, 'crh', NULL, 'Crimean Tatar; Crimean Turkish');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (78, NULL, 'crp', NULL, 'Creoles and pidgins (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (79, NULL, 'csb', NULL, 'Kashubian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (80, NULL, 'cus', NULL, 'Cushitic (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (81, NULL, 'dak', NULL, 'Dakota');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (82, NULL, 'dar', NULL, 'Dargwa');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (83, NULL, 'day', NULL, 'Land Dayak languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (84, NULL, 'del', NULL, 'Delaware');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (85, NULL, 'den', NULL, 'Slave (Athapascan)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (86, NULL, 'dgr', NULL, 'Dogrib');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (87, NULL, 'din', NULL, 'Dinka');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (88, NULL, 'doi', NULL, 'Dogri');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (89, NULL, 'dra', NULL, 'Dravidian (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (90, NULL, 'dsb', NULL, 'Lower Sorbian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (91, NULL, 'dua', NULL, 'Duala');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (92, NULL, 'dum', NULL, 'Dutch, Middle (ca.1050-1350)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (93, NULL, 'dyu', NULL, 'Dyula');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (94, NULL, 'efi', NULL, 'Efik');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (95, NULL, 'egy', NULL, 'Egyptian (Ancient)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (96, NULL, 'eka', NULL, 'Ekajuk');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (97, NULL, 'elx', NULL, 'Elamite');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (98, NULL, 'enm', NULL, 'English, Middle (1100-1500)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (99, NULL, 'ewo', NULL, 'Ewondo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (100, NULL, 'fan', NULL, 'Fang');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (101, NULL, 'fat', NULL, 'Fanti');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (102, NULL, 'fil', NULL, 'Filipino; Pilipino');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (103, NULL, 'fiu', NULL, 'Finno-Ugrian (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (104, NULL, 'fon', NULL, 'Fon');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (105, NULL, 'frm', NULL, 'French, Middle (ca.1400-1600)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (106, NULL, 'fro', NULL, 'French, Old (842-ca.1400)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (107, 38, 'frr', NULL, 'Northern Frisian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (108, 38, 'frs', NULL, 'Eastern Frisian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (109, 159, 'fur', NULL, 'Friulian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (110, 148, 'gaa', NULL, 'Ga');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (111, NULL, 'gay', NULL, 'Gayo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (112, NULL, 'gba', NULL, 'Gbaya');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (113, NULL, 'gem', NULL, 'Germanic (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (114, 153, 'gez', NULL, 'Geez');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (115, NULL, 'gil', NULL, 'Gilbertese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (116, NULL, 'gmh', NULL, 'German, Middle High (ca.1050-1500)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (117, NULL, 'goh', NULL, 'German, Old High (ca.750-1050)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (118, NULL, 'gon', NULL, 'Gondi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (119, NULL, 'gor', NULL, 'Gorontalo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (120, NULL, 'got', NULL, 'Gothic');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (121, NULL, 'grb', NULL, 'Grebo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (122, NULL, 'grc', NULL, 'Greek, Ancient (to 1453)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (123, NULL, 'gsw', NULL, 'Swiss German; Alemannic; Alsatian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (124, NULL, 'gwi', NULL, 'Gwich''in');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (125, NULL, 'hai', NULL, 'Haida');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (126, 163, 'haw', NULL, 'Hawaiian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (127, NULL, 'hil', NULL, 'Hiligaynon');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (128, NULL, 'him', NULL, 'Himachali');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (129, NULL, 'hit', NULL, 'Hittite');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (130, NULL, 'hmn', NULL, 'Hmong');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (131, NULL, 'hsb', NULL, 'Upper Sorbian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (132, NULL, 'hup', NULL, 'Hupa hupa');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (133, NULL, 'iba', NULL, 'Iban');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (134, NULL, 'ijo', NULL, 'Ijo languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (135, NULL, 'ilo', NULL, 'Iloko');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (136, NULL, 'inc', NULL, 'Indic (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (137, NULL, 'ine', NULL, 'Indo-European (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (138, NULL, 'inh', NULL, 'Ingush');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (139, NULL, 'ira', NULL, 'Iranian (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (140, NULL, 'iro', NULL, 'Iroquoian languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (141, NULL, 'jbo', NULL, 'Lojban');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (142, NULL, 'jpr', NULL, 'Judeo-Persian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (143, NULL, 'jrb', NULL, 'Judeo-Arabic');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (144, NULL, 'kaa', NULL, 'Kara-Kalpak');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (145, NULL, 'kab', NULL, 'Kabyle');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (146, NULL, 'kac', NULL, 'Kachin; Jingpho');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (147, 150, 'kam', NULL, 'Kamba');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (148, NULL, 'kar', NULL, 'Karen languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (149, NULL, 'kaw', NULL, 'Kawi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (150, NULL, 'kbd', NULL, 'Kabardian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (151, NULL, 'kha', NULL, 'Khasi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (152, NULL, 'khi', NULL, 'Khoisan (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (153, NULL, 'kho', NULL, 'Khotanese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (154, NULL, 'kmb', NULL, 'Kimbundu');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (155, 147, 'kok', NULL, 'Konkani');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (156, NULL, 'kos', NULL, 'Kosraean');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (157, NULL, 'kpe', NULL, 'Kpelle');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (158, NULL, 'krc', NULL, 'Karachay-Balkar');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (159, NULL, 'krl', NULL, 'Karelian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (160, NULL, 'kro', NULL, 'Kru languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (161, NULL, 'kru', NULL, 'Kurukh');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (162, NULL, 'kum', NULL, 'Kumyk');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (163, NULL, 'kut', NULL, 'Kutenai');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (164, NULL, 'lad', NULL, 'Ladino');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (165, NULL, 'lah', NULL, 'Lahnda');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (166, NULL, 'lam', NULL, 'Lamba');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (167, NULL, 'lez', NULL, 'Lezghian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (168, NULL, 'lol', NULL, 'Mongo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (169, NULL, 'loz', NULL, 'Lozi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (170, NULL, 'lua', NULL, 'Luba-Lulua');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (171, NULL, 'lui', NULL, 'Luiseno');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (172, NULL, 'lun', NULL, 'Lunda');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (173, NULL, 'luo', NULL, 'Luo (Kenya and Tanzania)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (174, NULL, 'lus', NULL, 'Lushai');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (175, NULL, 'mad', NULL, 'Madurese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (176, NULL, 'mag', NULL, 'Magahi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (177, NULL, 'mai', NULL, 'Maithili');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (178, NULL, 'mak', NULL, 'Makasar');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (179, NULL, 'man', NULL, 'Mandingo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (180, NULL, 'map', NULL, 'Austronesian (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (181, NULL, 'mas', NULL, 'Masai');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (182, NULL, 'mdf', NULL, 'Moksha');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (183, NULL, 'mdr', NULL, 'Mandar');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (184, NULL, 'men', NULL, 'Mende');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (185, NULL, 'mga', NULL, 'Irish, Middle (900-1200)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (186, NULL, 'mic', NULL, 'Mi''kmaq; Micmac');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (187, NULL, 'min', NULL, 'Minangkabau');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (188, NULL, 'mis', NULL, 'Uncoded languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (189, NULL, 'mkh', NULL, 'Mon-Khmer (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (190, NULL, 'mnc', NULL, 'Manchu');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (191, NULL, 'mni', NULL, 'Manipuri');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (192, NULL, 'mno', NULL, 'Manobo languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (193, NULL, 'moh', NULL, 'Mohawk');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (194, NULL, 'mos', NULL, 'Mossi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (195, NULL, 'mul', NULL, 'Multiple languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (196, NULL, 'mun', NULL, 'Munda languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (197, NULL, 'mus', NULL, 'Creek');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (198, NULL, 'mwl', NULL, 'Mirandese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (199, NULL, 'mwr', NULL, 'Marwari');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (200, NULL, 'myn', NULL, 'Mayan languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (201, NULL, 'myv', NULL, 'Erzya');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (202, NULL, 'nah', NULL, 'Nahuatl languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (203, NULL, 'nai', NULL, 'North American Indian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (204, NULL, 'nap', NULL, 'Neapolitan');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (205, NULL, 'nds', NULL, 'Low German; Low Saxon; German, Low; Saxon, Low');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (206, NULL, 'new', NULL, 'Nepal Bhasa; Newari');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (207, NULL, 'nia', NULL, 'Nias');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (208, NULL, 'nic', NULL, 'Niger-Kordofanian (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (209, NULL, 'niu', NULL, 'Niuean');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (210, NULL, 'nog', NULL, 'Nogai');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (211, NULL, 'non', NULL, 'Norse, Old');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (212, NULL, 'nqo', NULL, 'N''Ko');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (213, NULL, 'nso', NULL, 'Pedi; Sepedi; Northern Sotho');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (214, NULL, 'nub', NULL, 'Nubian languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (215, NULL, 'nwc', NULL, 'Classical Newari; Old Newari; Classical Nepal Bhasa');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (216, NULL, 'nym', NULL, 'Nyamwezi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (217, NULL, 'nyn', NULL, 'Nyankole');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (218, NULL, 'nyo', NULL, 'Nyoro');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (219, NULL, 'nzi', NULL, 'Nzima');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (220, NULL, 'osa', NULL, 'Osage');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (221, NULL, 'ota', NULL, 'Turkish, Ottoman (1500-1928)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (222, NULL, 'oto', NULL, 'Otomian languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (223, NULL, 'paa', NULL, 'Papuan (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (224, NULL, 'pag', NULL, 'Pangasinan');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (225, NULL, 'pal', NULL, 'Pahlavi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (226, NULL, 'pam', NULL, 'Pampanga; Kapampangan');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (227, NULL, 'pap', NULL, 'Papiamento');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (228, NULL, 'pau', NULL, 'Palauan');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (229, NULL, 'peo', NULL, 'Persian, Old (ca.600-400 B.C.)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (230, NULL, 'phi', NULL, 'Philippine (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (231, NULL, 'phn', NULL, 'Phoenician');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (232, NULL, 'pon', NULL, 'Pohnpeian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (233, NULL, 'pra', NULL, 'Prakrit languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (234, NULL, 'pro', NULL, 'Provencal, Old (to 1500)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (235, NULL, 'raj', NULL, 'Rajasthani');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (236, NULL, 'rap', NULL, 'Rapanui');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (237, NULL, 'rar', NULL, 'Rarotongan; Cook Islands Maori');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (238, NULL, 'roa', NULL, 'Romance (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (239, NULL, 'rom', NULL, 'Romany');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (240, NULL, 'rup', NULL, 'Aromanian; Arumanian; Macedo-Romanian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (241, NULL, 'sad', NULL, 'Sandawe');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (242, NULL, 'sah', NULL, 'Yakut');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (243, NULL, 'sai', NULL, 'South American Indian (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (244, NULL, 'sal', NULL, 'Salishan languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (245, NULL, 'sam', NULL, 'Samaritan Aramaic');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (246, NULL, 'sas', NULL, 'Sasak');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (247, NULL, 'sat', NULL, 'Santali');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (248, NULL, 'scn', NULL, 'Sicilian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (249, NULL, 'sco', NULL, 'Scots');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (250, NULL, 'sel', NULL, 'Selkup');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (251, NULL, 'sem', NULL, 'Semitic (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (252, NULL, 'sga', NULL, 'Irish, Old (to 900)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (253, NULL, 'sgn', NULL, 'Sign languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (254, NULL, 'shn', NULL, 'Shan');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (255, 155, 'sid', NULL, 'Sidamo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (256, NULL, 'sio', NULL, 'Siouan languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (257, NULL, 'sit', NULL, 'Sino-Tibetan (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (258, NULL, 'sla', NULL, 'Slavic (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (259, NULL, 'sma', NULL, 'Southern Sami');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (260, NULL, 'smi', NULL, 'Sami languages (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (261, NULL, 'smj', NULL, 'Lule Sami');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (262, NULL, 'smn', NULL, 'Inari Sami');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (263, NULL, 'sms', NULL, 'Skolt Sami');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (264, NULL, 'snk', NULL, 'Soninke');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (265, NULL, 'sog', NULL, 'Sogdian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (266, NULL, 'son', NULL, 'Songhai languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (267, NULL, 'srn', NULL, 'Sranan Tongo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (268, NULL, 'srr', NULL, 'Serer');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (269, NULL, 'ssa', NULL, 'Nilo-Saharan (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (270, NULL, 'suk', NULL, 'Sukuma');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (271, NULL, 'sus', NULL, 'Susu');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (272, NULL, 'sux', NULL, 'Sumerian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (273, NULL, 'syc', NULL, 'Classical Syriac');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (274, 151, 'syr', NULL, 'Syriac');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (275, NULL, 'tai', NULL, 'Tai (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (276, NULL, 'tem', NULL, 'Timne');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (277, NULL, 'ter', NULL, 'Tereno');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (278, NULL, 'tet', NULL, 'Tetum');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (279, 157, 'tig', NULL, 'Tigre');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (280, NULL, 'tiv', NULL, 'Tiv');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (281, NULL, 'tkl', NULL, 'Tokelau');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (282, NULL, 'tlh', NULL, 'Klingon');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (283, NULL, 'tli', NULL, 'Tlingit');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (284, NULL, 'tmh', NULL, 'Tamashek');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (285, NULL, 'tog', NULL, 'Tonga (Nyasa)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (286, NULL, 'tpi', NULL, 'Tok Pisin');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (287, NULL, 'tsi', NULL, 'Tsimshian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (288, NULL, 'tum', NULL, 'Tumbuka');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (289, NULL, 'tup', NULL, 'Tupi languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (290, NULL, 'tut', NULL, 'Altaic (Other)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (291, NULL, 'tvl', NULL, 'Tuvalu');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (292, NULL, 'tyv', NULL, 'Tuvinian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (293, NULL, 'udm', NULL, 'Udmurt');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (294, NULL, 'uga', NULL, 'Ugaritic');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (295, NULL, 'umb', NULL, 'Umbundu');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (296, NULL, 'und', NULL, 'Undetermined');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (297, NULL, 'vai', NULL, 'Vai');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (298, NULL, 'vot', NULL, 'Votic');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (299, NULL, 'wak', NULL, 'Wakashan languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (300, 162, 'wal', NULL, 'Walamo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (301, NULL, 'war', NULL, 'Waray');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (302, NULL, 'was', NULL, 'Washo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (303, NULL, 'wen', NULL, 'Sorbian languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (304, NULL, 'xal', NULL, 'Kalmyk; Oirat');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (305, NULL, 'yao', NULL, 'Yao');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (306, NULL, 'yap', NULL, 'Yapese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (307, NULL, 'ypk', NULL, 'Yupik languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (308, NULL, 'zap', NULL, 'Zapotec');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (309, NULL, 'zbl', NULL, 'Blissymbols; Blissymbolics; Bliss');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (310, NULL, 'zen', NULL, 'Zenaga');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (311, NULL, 'znd', NULL, 'Zande languages');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (312, NULL, 'zun', NULL, 'Zuni');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (313, NULL, 'zxx', NULL, 'No linguistic content');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (314, NULL, 'zza', NULL, 'Zaza; Dimili; Dimli; Kirdki; Kirmanjki; Zazaki');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (315, 4, 'aar', 'aa', 'Afar');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (316, 2, 'abk', 'ab', 'Abkhazian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (317, NULL, 'ave', 'ae', 'Avestan');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (318, 5, 'afr', 'af', 'Afrikaans');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (319, 146, 'aka', 'ak', 'Akan');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (320, 7, 'amh', 'am', 'Amharic');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (321, NULL, 'arg', 'an', 'Aragonese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (322, 8, 'ara', 'ar', 'Arabic');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (323, 10, 'asm', 'as', 'Assamese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (324, NULL, 'ava', 'av', 'Avaric');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (325, 11, 'aym', 'ay', 'Aymara');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (326, 12, 'aze', 'az', 'Azerbaijani');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (327, 13, 'bak', 'ba', 'Bashkir');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (328, NULL, 'bel', 'be', 'Belarusian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (329, 20, 'bul', 'bg', 'Bulgarian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (330, 17, 'bih', 'bh', 'Bihari');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (331, 18, 'bis', 'bi', 'Bislama');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (332, NULL, 'bam', 'bm', 'Bambara');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (333, 15, 'ben', 'bn', 'Bengali');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (334, 121, 'bod', 'bo', 'Tibetan');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (335, 19, 'bre', 'br', 'Breton');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (336, 142, 'bos', 'bs', 'Bosnian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (337, 24, 'cat', 'ca', 'Catalan; Valencian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (338, NULL, 'che', 'ce', 'Chechen');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (339, NULL, 'cha', 'ch', 'Chamorro');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (340, 26, 'cos', 'co', 'Corsican');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (341, NULL, 'cre', 'cr', 'Cree');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (342, 28, 'ces', 'cs', 'Czech');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (343, NULL, 'chu', 'cu', 'Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (344, NULL, 'chv', 'cv', 'Chuvash');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (345, 134, 'cym', 'cy', 'Welsh');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (346, 29, 'dan', 'da', 'Danish');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (347, 42, 'deu', 'de', 'German');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (348, 143, 'div', 'dv', 'Divehi; Dhivehi; Maldivian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (349, NULL, 'dzo', 'dz', 'Dzongkha');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (350, 161, 'ewe', 'ee', 'Ewe');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (351, 42, 'ell', 'el', 'Greek, Modern (1453-)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (352, 31, 'eng', 'en', 'English');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (353, 32, 'epo', 'eo', 'Esperanto');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (354, 111, 'spa', 'es', 'Spanish; Castilian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (355, 33, 'est', 'et', 'Estonian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (356, 14, 'eus', 'eu', 'Basque');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (357, 89, 'fas', 'fa', 'Persian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (358, NULL, 'ful', 'ff', 'Fulah');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (359, 36, 'fin', 'fi', 'Finnish');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (360, 35, 'fij', 'fj', 'Fijian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (361, 34, 'fao', 'fo', 'Faroese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (362, 37, 'fra', 'fr', 'French');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (363, 38, 'fry', 'fy', 'Western Frisian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (364, 57, 'gle', 'ga', 'Irish');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (365, 39, 'gla', 'gd', 'Gaelic; Scottish Gaelic');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (366, 40, 'glg', 'gl', 'Galician');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (367, 45, 'grn', 'gn', 'Guarani');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (368, 46, 'guj', 'gu', 'Gujarati');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (369, 144, 'glv', 'gv', 'Manx');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (370, 47, 'hau', 'ha', 'Hausa');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (371, 48, 'heb', 'he', 'Hebrew');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (372, 49, 'hin', 'hi', 'Hindi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (373, NULL, 'hmo', 'ho', 'Hiri Motu');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (374, 27, 'hrv', 'hr', 'Croatian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (375, NULL, 'hat', 'ht', 'Haitian; Haitian Creole');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (376, 50, 'hun', 'hu', 'Hungarian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (377, 9, 'hye', 'hy', 'Armenian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (378, NULL, 'her', 'hz', 'Herero');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (379, 53, 'ina', 'ia', 'Interlingua (International Auxiliary language Association)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (380, 52, 'ind', 'id', 'Indonesian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (381, 54, 'ile', 'ie', 'Interlingue; Occidental');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (382, 149, 'ibo', 'ig', 'Igbo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (383, NULL, 'iii', 'ii', 'Sichuan Yi; Nuosu');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (384, 56, 'ipk', 'ik', 'Inupiaq');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (385, NULL, 'ido', 'io', 'Ido');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (386, 51, 'isl', 'is', 'Icelandic');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (387, 58, 'ita', 'it', 'Italian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (388, 55, 'iku', 'iu', 'Inuktitut');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (389, 59, 'jpn', 'ja', 'Japanese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (390, 60, 'jav', 'jv', 'Javanese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (391, 41, 'kat', 'ka', 'Georgian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (392, NULL, 'kon', 'kg', 'Kongo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (393, NULL, 'kik', 'ki', 'Kikuyu; Gikuyu');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (394, NULL, 'kua', 'kj', 'Kuanyama; Kwanyama');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (395, 63, 'kaz', 'kk', 'Kazakh');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (396, 44, 'kal', 'kl', 'Kalaallisut; Greenlandic');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (397, NULL, 'khm', 'km', 'Central Khmer');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (398, 61, 'kan', 'kn', 'Kannada');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (399, 66, 'kor', 'ko', 'Korean');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (400, NULL, 'kau', 'kr', 'Kanuri');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (401, 62, 'kas', 'ks', 'Kashmiri');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (402, 67, 'kur', 'ku', 'Kurdish');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (403, NULL, 'kom', 'kv', 'Komi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (404, 145, 'cor', 'kw', 'Cornish');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (405, 65, 'kir', 'ky', 'Kirghiz; Kyrgyz');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (406, 70, 'lat', 'la', 'Latin');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (407, NULL, 'ltz', 'lb', 'Luxembourgish; Letzeburgesch');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (408, NULL, 'lug', 'lg', 'Ganda');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (409, NULL, 'lim', 'li', 'Limburgan; Limburger; Limburgish');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (410, 72, 'lin', 'ln', 'Lingala');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (411, NULL, 'lao', 'lo', 'Lao');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (412, 73, 'lit', 'lt', 'Lithuanian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (413, NULL, 'lub', 'lu', 'Luba-Katanga');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (414, 71, 'lav', 'lv', 'Latvian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (415, 75, 'mlg', 'mg', 'Malagasy');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (416, NULL, 'mah', 'mh', 'Marshallese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (417, 79, 'mri', 'mi', 'Maori');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (418, 74, 'mkd', 'mk', 'Macedonian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (419, 77, 'mal', 'ml', 'Malayalam');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (420, 82, 'mon', 'mn', 'Mongolian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (421, 81, 'mol', 'mo', 'Moldavian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (422, 80, 'mar', 'mr', 'Marathi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (423, 76, 'msa', 'ms', 'Malay');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (424, 78, 'mlt', 'mt', 'Maltese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (425, 21, 'mya', 'my', 'Burmese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (426, 83, 'nau', 'na', 'Nauru');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (427, 85, 'nob', 'nb', 'Bokmal, Norwegian; Norwegian Bokmal');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (428, NULL, 'nde', 'nd', 'Ndebele, North; North Ndebele');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (429, 84, 'nep', 'ne', 'Nepali');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (430, NULL, 'ndo', 'ng', 'Ndonga');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (431, 30, 'nld', 'nl', 'Dutch; Flemish');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (432, 141, 'nno', 'nn', 'Norwegian Nynorsk; Nynorsk, Norwegian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (433, 141, 'nor', 'no', 'Norwegian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (434, NULL, 'nbl', 'nr', 'Ndebele, South; South Ndebele');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (435, NULL, 'nav', 'nv', 'Navajo; Navaho');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (436, 165, 'nya', 'ny', 'Chichewa; Chewa; Nyanja');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (437, 86, 'oci', 'oc', 'Occitan (post 1500); Provencal');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (438, NULL, 'oji', 'oj', 'Ojibwa');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (439, NULL, 'orm', 'om', 'Oromo');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (440, 87, 'ori', 'or', 'Oriya');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (441, NULL, 'oss', 'os', 'Ossetian; Ossetic');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (442, 92, 'pan', 'pa', 'Panjabi; Punjabi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (443, NULL, 'pli', 'pi', 'Pali');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (444, 90, 'pol', 'pl', 'Polish');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (445, 88, 'pus', 'ps', 'Pushto; Pashto');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (446, 91, 'por', 'pt', 'Portuguese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (447, 93, 'que', 'qu', 'Quechua');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (448, 94, 'roh', 'rm', 'Romansh');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (449, NULL, 'run', 'rn', 'Rundi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (450, 95, 'ron', 'ro', 'Romanian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (451, 96, 'rus', 'ru', 'Russian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (452, 64, 'kin', 'rw', 'Kinyarwanda');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (453, 99, 'san', 'sa', 'Sanskrit');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (454, NULL, 'srd', 'sc', 'Sardinian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (455, 105, 'snd', 'sd', 'Sindhi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (456, NULL, 'sme', 'se', 'Northern Sami');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (457, 98, 'sag', 'sg', 'Sango');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (458, 106, 'sin', 'si', 'Sinhala; Sinhalese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (459, 108, 'slk', 'sk', 'Slovak');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (460, 109, 'slv', 'sl', 'Slovenian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (461, 97, 'smo', 'sm', 'Samoan');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (462, 104, 'sna', 'sn', 'Shona');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (463, 110, 'som', 'so', 'Somali');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (464, 6, 'sqi', 'sq', 'Albanian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (465, 100, 'srp', 'sr', 'Serbian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (466, NULL, 'ssw', 'ss', 'Swati');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (467, NULL, 'sot', 'st', 'Sotho, Southern');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (468, 112, 'sun', 'su', 'Sundanese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (469, 114, 'swe', 'sv', 'Swedish');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (470, 113, 'swa', 'sw', 'Swahili');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (471, 117, 'tam', 'ta', 'Tamil');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (472, 119, 'tel', 'te', 'Telugu');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (473, 116, 'tgk', 'tg', 'Tajik');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (474, 120, 'tha', 'th', 'Thai');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (475, 122, 'tir', 'ti', 'Tigrinya');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (476, 126, 'tuk', 'tk', 'Turkmen');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (477, 115, 'tgl', 'tl', 'Tagalog');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (478, NULL, 'tsn', 'tn', 'Tswana');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (479, 123, 'ton', 'to', 'Tonga (Tonga Islands)');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (480, 125, 'tur', 'tr', 'Turkish');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (481, 124, 'tso', 'ts', 'Tsonga');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (482, 118, 'tat', 'tt', 'Tatar');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (483, 127, 'twi', 'tw', 'Twi');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (484, NULL, 'tah', 'ty', 'Tahitian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (485, 128, 'uig', 'ug', 'Uighur; Uyghur');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (486, 129, 'ukr', 'uk', 'Ukrainian');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (487, 130, 'urd', 'ur', 'Urdu');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (488, 131, 'uzb', 'uz', 'Uzbek');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (489, 160, 'ven', 've', 'Venda');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (490, 132, 'vie', 'vi', 'Vietnamese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (491, 133, 'vol', 'vo', 'Volapak');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (492, NULL, 'wln', 'wa', 'Walloon');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (493, 135, 'wol', 'wo', 'Wolof');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (494, 136, 'xho', 'xh', 'Xhosa');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (495, 137, 'yid', 'yi', 'Yiddish');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (496, 138, 'yor', 'yo', 'Yoruba');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (497, 139, 'zha', 'za', 'Zhuang; Chuang');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (498, 25, 'zho', 'zh', 'Chinese');
INSERT INTO lang (lang_id, lang_qt_number, lang_abbr3, lang_abbr2, lang_name) VALUES (499, 140, 'zul', 'zu', 'Zulu');

ALTER TABLE lang ENABLE TRIGGER ALL;

--
-- Data for Name: locale; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE locale DISABLE TRIGGER ALL;

INSERT INTO locale (locale_id, locale_code, locale_descrip, locale_lang_file, locale_dateformat, locale_currformat, locale_qtyformat, locale_comments, locale_qtyperformat, locale_salespriceformat, locale_extpriceformat, locale_timeformat, locale_timestampformat, local_costformat, locale_costformat, locale_purchpriceformat, locale_uomratioformat, locale_intervalformat, locale_lang_id, locale_country_id, locale_error_color, locale_warning_color, locale_emphasis_color, locale_altemphasis_color, locale_expired_color, locale_future_color, locale_curr_scale, locale_salesprice_scale, locale_purchprice_scale, locale_extprice_scale, locale_cost_scale, locale_qty_scale, locale_qtyper_scale, locale_uomratio_scale, locale_percent_scale, locale_weight_scale) VALUES (3, 'Default', 'Default Locale', '', 'DD Mon YYYY', '999,999,990.00', '.-', '', '999,999,990.0000', '999,999,990.0000', '999,999,990.00', 'HH:MI:SS', 'DD Mon YYYY HH:MI:SS', NULL, '999,999,990.0000', '999,999,990.0000', '999,999,990.00000', 'HH:MI:SS', -1, -1, '', '', '', '', '', '', 2, 4, 4, 2, 4, 2, 4, 5, 2, 2);
INSERT INTO locale (locale_id, locale_code, locale_descrip, locale_lang_file, locale_dateformat, locale_currformat, locale_qtyformat, locale_comments, locale_qtyperformat, locale_salespriceformat, locale_extpriceformat, locale_timeformat, locale_timestampformat, local_costformat, locale_costformat, locale_purchpriceformat, locale_uomratioformat, locale_intervalformat, locale_lang_id, locale_country_id, locale_error_color, locale_warning_color, locale_emphasis_color, locale_altemphasis_color, locale_expired_color, locale_future_color, locale_curr_scale, locale_salesprice_scale, locale_purchprice_scale, locale_extprice_scale, locale_cost_scale, locale_qty_scale, locale_qtyper_scale, locale_uomratio_scale, locale_percent_scale, locale_weight_scale) VALUES (4, 'Spanish', 'Locale for Mexican Spanish', 'OpenMFG.mx.sp', 'DD Mon YYYY', '999999990.00', '.-', '', '999999990.0000', '999999990.0000', '999999990.00', 'HH:MI:SS', 'DD Mon YYYY HH:MI:SS', NULL, '999999990.0000', '', '', 'HH:MI:SS', -1, -1, '', '', '', '', '', '', 2, 4, 0, 2, 4, 2, 4, 0, 2, 2);

ALTER TABLE locale ENABLE TRIGGER ALL;


--
-- Data for Name: metasql; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE metasql DISABLE TRIGGER ALL;

ALTER TABLE metasql ENABLE TRIGGER ALL;


--
-- Data for Name: metric; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE metric DISABLE TRIGGER ALL;

INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (22, 'FreightAccount', '1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (23, 'DefaultARAccount', '2', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (44, 'DefaultAPAccount', '3', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (20, 'InvoiceCustomer', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (21, 'InvoiceBilling', '0', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (51, 'DatabaseName!', 'Schema Benchmark', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (70, 'InvoiceWatermark2', '', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (71, 'InvoiceShowPrices2', '102', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (72, 'InvoiceWatermark3', '', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (73, 'InvoiceShowPrices3', '102', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (49, 'AccountingSystemImportPath', 'C:/OpenMFG', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (50, 'AccountingSystemExportPath', 'C:/OpenMFG', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (78, 'CreditMemoWatermark2', '', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (79, 'CreditMemoShowPrices2', '116', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (80, 'CreditMemoWatermark3', '', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (81, 'CreditMemoShowPrices3', '116', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (48, 'AccountingSystem', 'Native', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (2, 'DefaultEventFence', '10', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (62, 'MaxLocationNameSize', '10', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (3, 'PostCountTagToDefault', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (4, 'CountSlipAuditing', 'B', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (14, 'AllowDiscounts', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (15, 'AllowASAPShipSchedules', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (16, 'CONumberGeneration', 'A', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (17, 'QUNumberGeneration', 'A', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (18, 'CMNumberGeneration', 'A', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (24, 'DefaultShipFormId', '-1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (26, 'DefaultPartialShipments', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (27, 'DefaultBackOrders', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (28, 'DefaultFreeFormShiptos', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (31, 'DefaultBalanceMethod', 'B', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (32, 'BOLShipper', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (33, 'BOLCustomer', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (34, 'BOLTraffic', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (35, 'BOLBilling', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (36, 'BOLMisc', '0', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (37, 'PONumberGeneration', 'A', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (38, 'VoucherNumberGeneration', 'A', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (39, 'PrNumberGeneration', 'A', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (40, 'POAllowFFVendorAddresses', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (43, 'DefaultPOShipVia', 'UPS', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (53, 'CustListSerial', '30', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (8, 'AutoExplodeSO', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (10, 'ExplodeSOEffective', 'E', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (11, 'SOExplosionLevel', 'M', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (84, 'AutoExplodeWO', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (86, 'ExplodeWOEffective', 'S', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (87, 'WOExplosionLevel', 'M', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (12, 'PostMaterialVariances', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (13, 'PostLaborVariances', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (90, 'ItemSiteChangeLog', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (91, 'WarehouseChangeLog', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (92, 'AllowInactiveBomItems', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (6, 'DefaultSoldItemsExclusive', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (93, 'ItemChangeLog', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (7, 'DefaultWomatlIssueMethod', 'M', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (94, 'DefaultMSCalendar', '-1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (85, 'WorkOrderChangeLog', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (9, 'WONumberGeneration', 'A', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (95, 'POChangeLog', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (96, 'VendorChangeLog', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (97, 'CustomerChangeLog', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (98, 'SalesOrderChangeLog', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (99, 'RestrictCreditMemos', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (100, 'AutoSelectForBilling', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (101, 'AlwaysShowSaveAndAdd', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (102, 'DisableSalesOrderPriceOverride', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (103, 'AutoAllocateCreditMemos', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (104, 'HideSOMiscCharge', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (105, 'EnableSOShipping', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (25, 'DefaultShipViaId', '-1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (106, 'DefaultCustType', '-1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (29, 'SOCreditLimit', '0', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (30, 'SOCreditRate', 'Not Checked', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (107, 'InvoiceDateSource', 'shipdate', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (64, 'InvoiceCopies', '2', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (66, 'InvoiceWatermark0', 'Internal', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (67, 'InvoiceShowPrices0', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (68, 'InvoiceWatermark1', 'Customer', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (69, 'InvoiceShowPrices1', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (65, 'CreditMemoCopies', '2', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (74, 'CreditMemoWatermark0', 'Internal', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (75, 'CreditMemoShowPrices0', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (76, 'CreditMemoWatermark1', 'Customer', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (77, 'CreditMemoShowPrices1', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (108, 'ShippingFormCopies', '1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (109, 'ShippingFormWatermark0', NULL, NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (110, 'ShippingFormShowPrices0', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (111, 'DisallowReceiptExcessQty', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (112, 'UseProjects', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (113, 'AutoCreateProjectsForOrders', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (114, 'HideApplyToBalance', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (54, 'remitto_name', 'Company Name', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (55, 'remitto_address1', 'Line 1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (56, 'remitto_address2', 'Line 2', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (57, 'remitto_address3', 'Line 3', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (58, 'remitto_city', 'City', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (59, 'remitto_state', 'ST', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (60, 'remitto_zipcode', '99999-9999', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (115, 'remitto_country', 'United States', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (61, 'remitto_phone', '(800) 555-1212', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (45, 'GLMainSize', '5', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (117, 'GLFFProfitCenters', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (118, 'GLFFSubaccounts', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (119, 'YearEndEquityAccount', '-1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (120, 'CurrencyGainLossAccount', '-1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (88, 'CurrencyExchangeSense', '1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (121, 'GLSeriesDiscrepancyAccount', '-1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (122, 'MandatoryGLEntryNotes', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (63, 'DatabaseName', 'Empty Database', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (52, 'DatabaseComments', 'Empty Database', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (125, 'UpdatePriceLineEdit', '2', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (126, 'UseEarliestAvailDateOnPOItem', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (127, 'RequireStdCostForPOItem', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (128, 'ShipmentNumberGeneration', 'A', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (129, 'WarnIfReceiptQtyDiffers', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (130, 'ReceiptQtyTolerancePct', '', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (116, 'GLCompanySize', '1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (46, 'GLProfitSize', '1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (47, 'GLSubaccountSize', '1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (131, 'AllowManualGLAccountEntry', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (132, 'DefaultTaxAuthority', '-1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (145, 'TransferOrderChangeLog', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (146, 'EnableTOShipping', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (148, 'MultiWhs', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (149, 'BBOM', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (150, 'Transforms', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (151, 'Routings', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (152, 'BufferMgt', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (153, 'LotSerialControl', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (154, 'Application', 'PostBooks', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (155, 'CCConfirmPreauth', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (156, 'CCConfirmCharge', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (157, 'CCConfirmChargePreauth', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (158, 'CCConfirmCredit', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (159, 'CCEnablePreauth', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (160, 'CCEnableCharge', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (161, 'CCAvsCheck', 'W', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (162, 'CCTestResult', 'P', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (164, 'RecurringInvoiceBuffer', '7', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (165, 'EmployeeChangeLog', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (167, 'AllowAvgCostMethod', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (168, 'AllowStdCostMethod', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (1, 'InterfaceToGL', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (170, 'AutoUpdateLocaleHasRun', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (171, 'LegacyCashReceipts', 'f', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (172, 'VerboseCommentList', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (169, 'AllowJobCostMethod', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (175, 'EFTRoutingRegex', '^\d{9}$', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (176, 'EFTAccountRegex', '^\d{4,17}$', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (177, 'EFTFunction', 'formatAchChecks', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (19, 'InvcNumberGeneration', 'A', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (180, 'CreditTaxDiscount', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (181, 'POCopies', '1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (182, 'POWatermark0', 'Vendor Copy', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (183, 'POWatermark1', 'Internal Copy #1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (184, 'NumberIssueResetIntervalDays', '1', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (185, 'InterfaceAPToGL', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (186, 'InterfaceARToGL', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (174, 'ACHSupported', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (187, 'AutoVersionUpdate', 't', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (188, 'RegistrationKey', 'JEEJT-CTWEJ-ZGY8Z-MXJZK-ECVCB', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (178, 'desktop/welcome', 'http://welcome.xtuple.org/index.html', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (179, 'desktop/timer', '900000', NULL);
INSERT INTO metric (metric_id, metric_name, metric_value, metric_module) VALUES (173, 'ServerVersion', '4.4.0', NULL);

ALTER TABLE metric ENABLE TRIGGER ALL;

-- This sequence is not used by a SERIAL column
SELECT pg_catalog.setval('misc_index_seq', 1166, true);

--
-- Data for Name: orderseq; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE orderseq DISABLE TRIGGER ALL;

INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (12, 'IncidentNumber', 1, 'incdt', 'incdt_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (5, 'InvcNumber', 1, 'invchead', 'invchead_invcnumber', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (10, 'PlanNumber', 1, 'planord', 'planord_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (6, 'PoNumber', 1, 'pohead', 'pohead_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (8, 'PrNumber', 1, 'pr', 'pr_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (3, 'QuNumber', 1, 'quhead', 'quhead_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (2, 'SoNumber', 1, 'cohead', 'cohead_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (7, 'VcNumber', 1, 'vohead', 'vohead_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (1, 'WoNumber', 1, 'wo', 'wo_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (15, 'ToNumber', 100, 'tohead', 'tohead_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (20, 'LsRegNumber', 1, 'lsreg', 'lsreg_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (18, 'AddressNumber', 1, 'addr', 'addr_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (19, 'ContactNumber', 1, 'cntct', 'cntct_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (21, 'AlarmNumber', 1, 'alarm', 'alarm_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (23, 'CashRcptNumber', 10000, 'cashrcpt', 'cashrcpt_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (24, 'ACHBatch', 1, 'checkhead', 'checkhead_ach_batch', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (13, 'APMemoNumber', 1, 'apmemo', 'apopen_docnumber', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (11, 'ARMemoNumber', 1, 'armemo', 'aropen_docnumber', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (4, 'CmNumber', 1, 'armemo', 'aropen_docnumber', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (25, 'OpportunityNumber', 1, 'ophead', 'ophead_number', NULL);
INSERT INTO orderseq (orderseq_id, orderseq_name, orderseq_number, orderseq_table, orderseq_numcol, orderseq_seqiss) VALUES (26, 'CRMAccountNumber', 0, 'crmacct', 'crmacct_number', NULL);

ALTER TABLE orderseq ENABLE TRIGGER ALL;


--
-- Data for Name: recurtype; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE recurtype DISABLE TRIGGER ALL;

INSERT INTO recurtype (recurtype_id, recurtype_type, recurtype_table, recurtype_donecheck, recurtype_schedcol, recurtype_limit, recurtype_copyfunc, recurtype_copyargs, recurtype_delfunc) VALUES (4, 'I', 'invchead', 'invchead_posted', 'invchead_invcdate', NULL, 'copyinvoice', '{integer,date}', 'deleteinvoice');
INSERT INTO recurtype (recurtype_id, recurtype_type, recurtype_table, recurtype_donecheck, recurtype_schedcol, recurtype_limit, recurtype_copyfunc, recurtype_copyargs, recurtype_delfunc) VALUES (3, 'J', 'prj', '(prj_completed_date IS NOT NULL OR prj_status = ''C'')', 'prj_due_date', NULL, 'copyprj', '{int,date}', NULL);
INSERT INTO recurtype (recurtype_id, recurtype_type, recurtype_table, recurtype_donecheck, recurtype_schedcol, recurtype_limit, recurtype_copyfunc, recurtype_copyargs, recurtype_delfunc) VALUES (5, 'V', 'vohead', 'vohead_posted', 'vohead_docdate', NULL, 'copyvoucher', '{integer,date}', NULL);
INSERT INTO recurtype (recurtype_id, recurtype_type, recurtype_table, recurtype_donecheck, recurtype_schedcol, recurtype_limit, recurtype_copyfunc, recurtype_copyargs, recurtype_delfunc) VALUES (2, 'INCDT', 'incdt', 'incdt_status IN (''R'', ''L'')', 'incdt_timestamp', NULL, 'copyincdt', '{int,timestamp}', 'deleteincident');
INSERT INTO recurtype (recurtype_id, recurtype_type, recurtype_table, recurtype_donecheck, recurtype_schedcol, recurtype_limit, recurtype_copyfunc, recurtype_copyargs, recurtype_delfunc) VALUES (1, 'TODO', 'todoitem', 'todoitem_completed_date IS NOT NULL', 'todoitem_due_date', 'checkprivilege(''MaintainAllToDoItems'') OR (checkprivilege(''MaintainPersonalToDoItems'') AND CURRENT_USER IN (todoitem_owner_username, todoitem_username))', 'copytodoitem', '{int,date,NULL}', NULL);

ALTER TABLE recurtype ENABLE TRIGGER ALL;


--
-- Data for Name: script; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE script DISABLE TRIGGER ALL;

INSERT INTO script (script_id, script_name, script_order, script_enabled, script_source, script_notes) VALUES (1, 'storedProcErrorLookup', 0, true, '/*
 * This file is part of the xTuple ERP: PostBooks Edition, a free and
 * open source Enterprise Resource Planning software suite,
 * Copyright (c) 1999-2009 by OpenMFG LLC, d/b/a xTuple.
 * It is licensed to you under the Common Public Attribution License
 * version 1.0, the full text of which (including xTuple-specific Exhibits)
 * is available at www.xtuple.com/CPAL.  By using this software, you agree
 * to be bound by its terms.
 */

/* This simplified version of xtuple/common/storedProcErrorLookup.cpp takes
   an error structure, allowing packages to define their own errors.
*/
function storedProcErrorLookup(procName, returnVal, errorStruct)
{
  var message;

  if (null != errorStruct)
  {
    if (procName in errorStruct &&
      returnVal in errorStruct[procName])
      message =  errorStruct[procName][returnVal];
    else
    {
      procName = procName.toLowerCase();
      for (var tmpProcName in errorStruct)
        if (procName == tmpProcName.toLowerCase())
        {
          message = errorStruct[tmpProcName][returnVal];
          break;
        }
    }

    if (message != null)
      return "<p>" + message
           + qsTr("<br>(%1, %2)<br>").arg(procName).arg(returnVal);
  }

  return toolbox.storedProcErrorLookup(procName, returnVal);
}
', 'this scripted version of the error lookup routine allows packages to define their own messages');


ALTER TABLE script ENABLE TRIGGER ALL;


--
-- Data for Name: sequence; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE sequence DISABLE TRIGGER ALL;

INSERT INTO sequence (sequence_value) SELECT generate_series(1, 1000);

ALTER TABLE sequence ENABLE TRIGGER ALL;

--
-- Dependencies: 775
-- Name: shipment_number_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
-- This sequence is not used by a SERIAL column

SELECT pg_catalog.setval('shipment_number_seq', 1, true);

--
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE source DISABLE TRIGGER ALL;

INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (1, 'CRM', 'ADDR', 'Address');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (2, 'Products', 'BBH', 'Breeder Bill of Materials');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (3, 'Products', 'BBI', 'Breeder Bill of Materials Item');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (4, 'Products', 'BMH', 'Bill of Materials');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (5, 'Products', 'BMI', 'Bill of Materials Item');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (6, 'Products', 'BOH', 'Bill of Operations');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (7, 'Products', 'BOI', 'Bill of Operations Item');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (8, 'CRM', 'CRMA', 'CRM Account');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (9, 'CRM', 'T', 'Contact');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (10, 'Sales', 'C', 'Customer');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (11, 'System', 'EMP', 'Employee');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (12, 'CRM', 'INCDT', 'Incident');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (13, 'Products', 'I', 'Item');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (14, 'Inventory', 'IS', 'Item Site');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (15, 'Purchase', 'IR', 'Item Source');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (16, 'Inventory', 'L', 'Location');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (17, 'Inventory', 'LS', 'Lot Serial');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (18, 'CRM', 'OPP', 'Opportunity');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (19, 'CRM', 'J', 'Project');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (20, 'Purchase', 'P', 'Purchase Order');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (21, 'Purchase', 'PI', 'Purchase Order Item');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (22, 'Sales', 'RA', 'Return Authorization');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (23, 'Sales', 'RI', 'Return Authorization Item');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (24, 'Sales', 'Q', 'Quote');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (25, 'Sales', 'QI', 'Quote Item');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (26, 'Sales', 'S', 'Sales Order');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (27, 'Sales', 'SI', 'Sales Order Item');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (28, 'Inventory', 'TO', 'Transfer Order');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (29, 'Inventory', 'TI', 'Transfer Order Item');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (30, 'Purchase', 'V', 'Vendor');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (31, 'Inventory', 'WH', 'Site');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (32, 'Manufacture', 'W', 'Work Order');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (33, 'CRM', 'TD', 'Todo Item');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (34, 'CRM', 'TA', 'Tasks');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (35, 'CRM', 'PSPCT', 'Prospect');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (36, 'Sales', 'SR', 'Sales Rep');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (37, 'Accounting', 'TAXAUTH', 'Tax Authority');
INSERT INTO source (source_id, source_module, source_name, source_descrip) VALUES (38, 'System', 'USR', 'User');

ALTER TABLE source ENABLE TRIGGER ALL;

--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE state DISABLE TRIGGER ALL;

-- USA
INSERT INTO state (state_name, state_abbr, state_country_id) VALUES
                  ('Alabama',                         'AL', 230),
                  ('Alaska',                          'AK', 230),
                  ('American Samoa',                  'AS', 230),
                  ('Arizona',                         'AZ', 230),
                  ('Arkansas',                        'AR', 230),
                  ('California',                      'CA', 230),
                  ('Colorado',                        'CO', 230),
                  ('Connecticut',                     'CT', 230),
                  ('Delaware',                        'DE', 230),
                  ('District Of Columbia',            'DC', 230),
                  ('Federated States Of Micronesia',  'FM', 230),
                  ('Florida',                         'FL', 230),
                  ('Georgia',                         'GA', 230),
                  ('Guam',                            'GU', 230),
                  ('Hawaii',                          'HI', 230),
                  ('Idaho',                           'ID', 230),
                  ('Illinois',                        'IL', 230),
                  ('Indiana',                         'IN', 230),
                  ('Iowa',                            'IA', 230),
                  ('Kansas',                          'KS', 230),
                  ('Kentucky',                        'KY', 230),
                  ('Louisiana',                       'LA', 230),
                  ('Maine',                           'ME', 230),
                  ('Marshall Islands',                'MH', 230),
                  ('Maryland',                        'MD', 230),
                  ('Massachusetts',                   'MA', 230),
                  ('Michigan',                        'MI', 230),
                  ('Minnesota',                       'MN', 230),
                  ('Mississippi',                     'MS', 230),
                  ('Missouri',                        'MO', 230),
                  ('Montana',                         'MT', 230),
                  ('Nebraska',                        'NE', 230),
                  ('Nevada',                          'NV', 230),
                  ('New Hampshire',                   'NH', 230),
                  ('New Jersey',                      'NJ', 230),
                  ('New Mexico',                      'NM', 230),
                  ('New York',                        'NY', 230),
                  ('North Carolina',                  'NC', 230),
                  ('North Dakota',                    'ND', 230),
                  ('Northern Mariana Islands',        'MP', 230),
                  ('Ohio',                            'OH', 230),
                  ('Oklahoma',                        'OK', 230),
                  ('Oregon',                          'OR', 230),
                  ('Palau',                           'PW', 230),
                  ('Pennsylvania',                    'PA', 230),
                  ('Puerto Rico',                     'PR', 230),
                  ('Rhode Island',                    'RI', 230),
                  ('South Carolina',                  'SC', 230),
                  ('South Dakota',                    'SD', 230),
                  ('Tennessee',                       'TN', 230),
                  ('Texas',                           'TX', 230),
                  ('Utah',                            'UT', 230),
                  ('Vermont',                         'VT', 230),
                  ('Virgin Islands',                  'VI', 230),
                  ('Virginia',                        'VA', 230),
                  ('Washington',                      'WA', 230),
                  ('West Virginia',                   'WV', 230),
                  ('Wisconsin',                       'WI', 230),
                  ('Wyoming',                         'WY', 230),
                  ('Armed Forces Africa, Canada, Europe, Middle East', 'AE', 230),
                  ('Armed Forces Americas (except Canada)',            'AA', 230),
                  ('Armed Forces Pacific',            'AP', 230);

-- Canada
INSERT INTO state (state_name, state_abbr, state_country_id) VALUES
                  ('Alberta',                      'AB', 39),
                  ('British Columbia',             'BC', 39),
                  ('Manitoba',                     'MB', 39),
                  ('New Brunswick',                'NB', 39),
                  ('Newfoundland and Labrador',    'NL', 39),
                  ('Northwest Territories',        'NT', 39),
                  ('Nova Scotia',                  'NS', 39),
                  ('Nunavut',                      'NU', 39),
                  ('Ontario',                      'ON', 39),
                  ('Prince Edward Island',         'PE', 39),
                  ('Quebec',                       'QC', 39),
                  ('Saskatchewan',                 'SK', 39),
                  ('Yukon',                        'YT', 39);

-- Mexico
INSERT INTO state (state_name, state_abbr, state_country_id) VALUES
                  ('Aguascalientes',               'AGS',   140),
                  ('Baja California',              'BC',    140),
                  ('Baja California Sur',          'BCS',   140),
                  ('Campeche',                     'CAM',   140),
                  ('Coahuila',                     'COAH',  140),
                  ('Colima',                       'COL',   140),
                  ('Chiapas',                      'CHIS',  140),
                  ('Chihuahua',                    'CHIH',  140),
                  ('Distrito Federal',             'DF',    140),
                  ('Durango',                      'DGO',   140),
                  ('Guanajuato',                   'GTO',   140),
                  ('Guerrero',                     'GRO',   140),
                  ('Hidalgo',                      'HGO',   140),
                  ('Jalisco',                      'JAL',   140),
                  ('Mexico',                       'MEX',   140),
                  ('Michoacan',                    'MICH',  140),
                  ('Morelos',                      'MOR',   140),
                  ('Nayarit',                      'NAY',   140),
                  ('Nuevo Leon',                   'NL',    140),
                  ('Oaxaca',                       'OAX',   140),
                  ('Puebla',                       'PUE',   140),
                  ('Queretaro',                    'QRO',   140),
                  ('Quintana Roo',                 'Q ROO', 140),
                  ('San Luis Potosi',              'SLP',   140),
                  ('Sinaloa',                      'SIN',   140),
                  ('Sonora',                       'SON',   140),
                  ('Tabasco',                      'TAB',   140),
                  ('Tamaulipas',                   'TAMPS', 140),
                  ('Tlaxcala',                     'TLAX',  140),
                  ('Veracruz',                     'VER',   140),
                  ('Yucatan',                      'YUC',   140),
                  ('Zacatecas',                    'ZAC',   140);

-- Australia
INSERT INTO state (state_name, state_abbr, state_country_id) VALUES
                  ('Australian Capital Territory', 'ACT', 13),
                  ('New South Wales',              'NSW', 13),
                  ('Northern Territory',           'NT',  13),
                  ('Queensland',                   'QLD', 13),
                  ('South Australia',              'SA',  13),
                  ('Tasmania',                     'TAS', 13),
                  ('Victoria',                     'VIC', 13),
                  ('Western Australia',            'WA',  13);

-- Germany
INSERT INTO state (state_name, state_abbr, state_country_id) VALUES
                  ('Schleswig-Holstein',     'SH', 81),
                  ('Mecklenburg-Vorpommern', 'MV', 81),
                  ('Hamburg',                'HH', 81),
                  ('Bremen',                 'HB', 81),
                  ('Berlin',                 'BE', 81),
                  ('Brandenburg',            'BB', 81),
                  ('Niedersachsen',          'NI', 81),
                  ('Nordrhein-Westfalen',    'NW', 81),
                  ('Sachsen-Anhalt',         'ST', 81),
                  ('Sachsen',                'SN', 81),
                  ('Hessen',                 'HE', 81),
                  ('Thüringen',              'TH', 81),
                  ('Bayern',                 'BY', 81),
                  ('Rheinland-Pfalz',        'RP', 81),
                  ('Saarland',               'SL', 81),
                  ('Baden-Württemberg',      'BW', 81);

-- Austria
INSERT INTO state (state_name, state_abbr, state_country_id) VALUES
                  ('Wien',              NULL, 14),
                  ('Niederösterreich',  NULL, 14),
                  ('Oberösterreich',    NULL, 14),
                  ('Steiermark',        NULL, 14),
                  ('Tirol',             NULL, 14),
                  ('Kärnten',           NULL, 14),
                  ('Salzburg',          NULL, 14),
                  ('Vorarlberg',        NULL, 14),
                  ('Burgenland',        NULL, 14);

-- Brazil
INSERT INTO state (state_name, state_abbr, state_country_id) VALUES
                  ('Acre',                 'AC', 30),
                  ('Alagoas',              'AL', 30),
                  ('Amapá',                'AP', 30),
                  ('Amazonas',             'AM', 30),
                  ('Bahia',                'VA', 30),
                  ('Ceará',                'CE', 30),
                  ('Distito Federal',      'DF', 30),
                  ('Espirito Santo',       'ES', 30),
                  ('Goiás',                'GO', 30),
                  ('Maranhão',             'MA', 30),
                  ('Mato Grosso',          'MT', 30),
                  ('Mato Grosso do Sul',   'MS', 30),
                  ('Minas Gerais',         'MG', 30),
                  ('Pará',                 'PA', 30),
                  ('Paraiba',              'PB', 30),
                  ('Paraná',               'PR', 30),
                  ('Pernambuco',           'PE', 30),
                  ('Piauí',                'PI', 30),
                  ('Rio de Janeiro',       'RJ', 30),
                  ('Rio Grande do Norte',  'RN', 30),
                  ('Rio Grande do Sul',    'RS', 30),
                  ('Rondônia',             'RO', 30),
                  ('Roraima',              'RR', 30),
                  ('Santa Catarina',       'SC', 30),
                  ('São Paulo',            'SP', 30),
                  ('Sergipe',              'SE', 30),
                  ('Tocantins',            'TO', 30);

-- China
INSERT INTO state (state_name, state_abbr, state_country_id) VALUES
                  ('Anhui',               'AH', 45),
                  ('Beijing',             'BJ', 45),
                  ('Chongqing',           'CQ', 45),
                  ('Fujian',              'FJ', 45),
                  ('Gansu',               'GS', 45),
                  ('Guangdong',           'GD', 45),
                  ('Guangxi Zhuang',      'GX', 45),
                  ('Guizhou',             'GZ', 45),
                  ('Hainan',              'HI', 45),
                  ('Heilongjiang',        'HL', 45),
                  ('Henan',               'HA', 45),
                  ('Hong Kong',           'HK', 45),
                  ('Hubei',               'HB', 45),
                  ('Hunan',               'HN', 45),
                  ('Inner Mongolia',      'NM', 45),
                  ('Jiangsu',             'JS', 45),
                  ('Jiangxi',             'JX', 45),
                  ('Jilin',               'JL', 45),
                  ('Liaoning',            'LN', 45),
                  ('Macau',               'MC', 45),
                  ('Ningxia Hui',         'NX', 45),
                  ('Qinghai',             'QH', 45),
                  ('Shaanxi',             'SN', 45),
                  ('Shandong',            'SD', 45),
                  ('Shanghai',            'SH', 45),
                  ('Shanxi',              'SX', 45),
                  ('Sichuan',             'SC', 45),
                  ('Taiwan',              'TW', 45),
                  ('Tianjin',             'TJ', 45),
                  ('Tibet',               'XZ', 45),
                  ('Xinjiang Uyghur',     'XJ', 45),
                  ('Yunnan',              'YN', 45),
                  ('Zhejiang',            'ZJ', 45);

-- India
INSERT INTO state (state_name, state_abbr, state_country_id) VALUES
                  ('Andaman and Nicobar Islands',         'AN', 100),
                  ('Andhra Pradesh',                      'AP', 100),
                  ('Arunachal Pradesh',                   'AR', 100),
                  ('Assam',                               'AS', 100),
                  ('Bihar',                               'BR', 100),
                  ('Chandigarh',                          'CH', 100),
                  ('Chhattisgarh',                        'CG', 100),
                  ('Dadra and Nagar Haveli',              'DN', 100),
                  ('Daman and Diu',                       'DD', 100),
                  ('Goa',                                 'GA', 100),
                  ('Gujarat',                             'GJ', 100),
                  ('Haryana',                             'HR', 100),
                  ('Himachal Pradesh',                    'HP', 100),
                  ('Jammu and Kashmir',                   'JK', 100),
                  ('Jharkhand',                           'JH', 100),
                  ('Karnataka',                           'KA', 100),
                  ('Kerala',                              'KL', 100),
                  ('Lakshadweep',                         'LD', 100),
                  ('Madhya Pradesh',                      'MP', 100),
                  ('Maharashtra',                         'MH', 100),
                  ('Manipur',                             'MN', 100),
                  ('Meghalaya',                           'ML', 100),
                  ('Mizoram',                             'MZ', 100),
                  ('Nagaland',                            'NL', 100),
                  ('National Capital Territory of Delhi', 'DL', 100),
                  ('Odisha',                              'OD', 100),
                  ('Puducherry',                          'PY', 100),
                  ('Punjab',                              'PB', 100),
                  ('Rajasthan',                           'RJ', 100),
                  ('Sikkim',                              'SK', 100),
                  ('Tamil Nadu',                          'TN', 100),
                  ('Telangana',                           'TS', 100),
                  ('Tripura',                             'TR', 100),
                  ('Uttar Pradesh',                       'UP', 100),
                  ('Uttarakhand',                         'UK', 100),
                  ('West Bengal',                         'WB', 100);

-- Italy
INSERT INTO state (state_name, state_abbr, state_country_id) VALUES
                  ('Agrigento',             'AG', 106),
                  ('Alessandria',           'AL', 106),
                  ('Ancona',                'AN', 106),
                  ('Aosta',                 'AO', 106),
                  ('Arezzo',                'AR', 106),
                  ('Ascoli Piceno',         'AP', 106),
                  ('Asti',                  'AT', 106),
                  ('Avellino',              'AV', 106),
                  ('Bari',                  'BA', 106),
                  ('Barletta-Andria-Trani', 'BT', 106),
                  ('Belluno',               'BL', 106),
                  ('Benevento',             'BN', 106),
                  ('Bergamo',               'BG', 106),
                  ('Biella',                'BI', 106),
                  ('Bologna',               'BO', 106),
                  ('South Tyrol',           'BZ', 106),
                  ('Brescia',               'BS', 106),
                  ('Brindisi',              'BR', 106),
                  ('Cagliari',              'CA', 106),
                  ('Caltanissetta',         'CL', 106),
                  ('Campobasso',            'CB', 106),
                  ('Carbonia-Iglesias',     'CI', 106),
                  ('Caserta',               'CE', 106),
                  ('Catania',               'CT', 106),
                  ('Catanzaro',             'CZ', 106),
                  ('Chieti',                'CH', 106),
                  ('Como',                  'CO', 106),
                  ('Cosenza',               'CS', 106),
                  ('Cremona',               'CR', 106),
                  ('Crotone',               'KR', 106),
                  ('Cuneo',                 'CN', 106),
                  ('Enna ',                 'EN', 106),
                  ('Fermo',                 'FM', 106),
                  ('Ferrara',               'FE', 106),
                  ('Florence',              'FI', 106),
                  ('Foggia',                'FG', 106),
                  ('Forlì-Cesena',          'FC', 106),
                  ('Frosinone',             'FR', 106),
                  ('Genoa',                 'GE', 106),
                  ('Gorizia',               'GO', 106),
                  ('Grosseto',              'GR', 106),
                  ('Imperia',               'IM', 106),
                  ('Isernia',               'IS', 106),
                  ('La Spezia',             'SP', 106),
                  ('L''Aquila',             'AQ', 106),
                  ('Latina',                'LT', 106),
                  ('Lecce',                 'LE', 106),
                  ('Lecco',                 'LC', 106),
                  ('Livorno',               'LI', 106),
                  ('Lodi',                  'LO', 106),
                  ('Lucca',                 'LU', 106),
                  ('Macerata',              'MC', 106),
                  ('Mantua',                'MN', 106),
                  ('Massa and Carrara',     'MS', 106),
                  ('Matera',                'MT', 106),
                  ('Medio Campidano',       'VS', 106),
                  ('Messina',               'ME', 106),
                  ('Milan',                 'MI', 106),
                  ('Modena',                'MO', 106),
                  ('Monza and Brianza',     'MB', 106),
                  ('Naples',                'NA', 106),
                  ('Novara',                'NO', 106),
                  ('Nuoro',                 'NU', 106),
                  ('Ogliastra',             'OG', 106),
                  ('Olbia-Tempio',          'OT', 106),
                  ('Oristano',              'OR', 106),
                  ('Padua',                 'PD', 106),
                  ('Palermo',               'PA', 106),
                  ('Parma',                 'PR', 106),
                  ('Pavia',                 'PV', 106),
                  ('Perugia',               'PG', 106),
                  ('Pesaro and Urbino',     'PU', 106),
                  ('Pescara',               'PE', 106),
                  ('Piacenza',              'PC', 106),
                  ('Pisa',                  'PI', 106),
                  ('Pistoia',               'PT', 106),
                  ('Pordenone',             'PN', 106),
                  ('Potenza',               'PZ', 106),
                  ('Prato',                 'PO', 106),
                  ('Ragusa',                'RG', 106),
                  ('Ravenna',               'RA', 106),
                  ('Reggio Calabria',       'RC', 106),
                  ('Reggio Emilia',         'RE', 106),
                  ('Rieti',                 'RI', 106),
                  ('Rimini',                'RN', 106),
                  ('Rome',                  'RM', 106),
                  ('Rovigo',                'RO', 106),
                  ('Salerno',               'SA', 106),
                  ('Sassari',               'SS', 106),
                  ('Savona',                'SV', 106),
                  ('Siena',                 'SI', 106),
                  ('Sondrio',               'SO', 106),
                  ('Syracuse',              'SR', 106),
                  ('Taranto',               'TA', 106),
                  ('Teramo',                'TE', 106),
                  ('Terni',                 'TR', 106),
                  ('Trapani',               'TP', 106),
                  ('Trento',                'TN', 106),
                  ('Treviso',               'TV', 106),
                  ('Trieste',               'TS', 106),
                  ('Turin',                 'TO', 106),
                  ('Udine',                 'UD', 106),
                  ('Varese',                'VA', 106),
                  ('Venice',                'VE', 106),
                  ('Verbano-Cusio-Ossola',  'VB', 106),
                  ('Vercelli',              'VC', 106),
                  ('Verona',                'VR', 106),
                  ('Vibo Valentia',         'VV', 106),
                  ('Vicenza',               'VI', 106),
                  ('Viterbo',               'VT', 106);

-- Netherlands
INSERT INTO state (state_name, state_abbr, state_country_id) VALUES
                  ('Drenthe',       NULL, 153),
                  ('Flevoland',     NULL, 153),
                  ('Fryslân',       NULL, 153),
                  ('Gelderland',    NULL, 153),
                  ('Groningen',     NULL, 153),
                  ('Limburg',       NULL, 153),
                  ('North Brabant', NULL, 153),
                  ('North Holland', NULL, 153),
                  ('Overijssel',    NULL, 153),
                  ('South Holland', NULL, 153),
                  ('Utrecht',       NULL, 153),
                  ('Zeeland',       NULL, 153);

ALTER TABLE state ENABLE TRIGGER ALL;

--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE status DISABLE TRIGGER ALL;

INSERT INTO status (status_id, status_type, status_code, status_name, status_seq, status_color) VALUES (1, 'INCDT', 'N', 'New', 0, 'white');
INSERT INTO status (status_id, status_type, status_code, status_name, status_seq, status_color) VALUES (2, 'INCDT', 'F', 'Feedback', 1, 'white');
INSERT INTO status (status_id, status_type, status_code, status_name, status_seq, status_color) VALUES (3, 'INCDT', 'C', 'Confirmed', 2, 'white');
INSERT INTO status (status_id, status_type, status_code, status_name, status_seq, status_color) VALUES (4, 'INCDT', 'A', 'Assigned', 3, 'white');
INSERT INTO status (status_id, status_type, status_code, status_name, status_seq, status_color) VALUES (5, 'INCDT', 'R', 'Resolved', 4, 'white');
INSERT INTO status (status_id, status_type, status_code, status_name, status_seq, status_color) VALUES (6, 'INCDT', 'L', 'Closed', 5, 'white');

ALTER TABLE status ENABLE TRIGGER ALL;

--
-- Data for Name: subaccnttype; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE subaccnttype DISABLE TRIGGER ALL;

INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (1, 'A', 'CA', 'Cash Assets');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (2, 'A', 'AR', 'Accounts Receivable');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (3, 'A', 'IN', 'Inventory');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (4, 'A', 'CAS', 'Current Assets');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (5, 'A', 'FA', 'Fixed Assets');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (6, 'A', 'AD', 'Accumulated Depreciation');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (7, 'L', 'CL', 'Current Liabilities');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (8, 'L', 'AP', 'Accounts Payable');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (9, 'L', 'LTL', 'Long Term Liabilities');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (10, 'Q', 'EDC', 'Equity do not close');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (11, 'Q', 'ERE', 'Equity Retained Earnings');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (12, 'Q', 'EC', 'Equity close');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (13, 'R', 'SI', 'Sales Income');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (14, 'R', 'II', 'Interest Income');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (15, 'R', 'IV', 'Investment Income');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (16, 'R', 'RT', 'Returns');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (17, 'E', 'COGS', 'Cost of Goods Sold');
INSERT INTO subaccnttype (subaccnttype_id, subaccnttype_accnt_type, subaccnttype_code, subaccnttype_descrip) VALUES (18, 'E', 'EXP', 'Expenses');

ALTER TABLE subaccnttype ENABLE TRIGGER ALL;

--
-- Data for Name: usrpref; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE usrpref DISABLE TRIGGER ALL;

INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (1, 'BackgroundImageid', '14', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (2, 'ShowIMMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (3, 'ShowPDMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (4, 'ShowMSMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (5, 'ShowCPMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (6, 'ShowWOMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (7, 'ShowPOMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (8, 'ShowSOMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (9, 'ShowSRMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (10, 'ShowSAMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (28, 'ShowGLMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (29, 'ShowAPMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (27, 'ShowARMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (109, 'ShowCRMMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (110, 'ShowPMMenu', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (117, 'IdleTimeout', '0', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (118, 'DefaultEllipsesAction', 'list', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (164, 'propername', 'OpenMFG Administrator', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (165, 'initials', 'ADMIN', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (167, 'locale_id', '3', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (168, 'agent', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (169, 'active', 't', 'mfgadmin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (170, 'window', '', 'mfgadmin');

INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (122, 'BackgroundImageid', '14', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (123, 'ShowIMMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (124, 'ShowPDMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (125, 'ShowMSMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (126, 'ShowCPMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (127, 'ShowWOMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (128, 'ShowPOMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (129, 'ShowSOMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (130, 'ShowSRMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (131, 'ShowSAMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (132, 'ShowGLMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (134, 'ShowAPMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (135, 'ShowARMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (148, 'ShowCRMMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (149, 'ShowPMMenu', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (159, 'IdleTimeout', '0', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (160, 'DefaultEllipsesAction', 'list', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (177, 'window', NULL, 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (171, 'propername', 'Administrator', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (173, 'email', 'admin@example.com', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (172, 'initials', 'ADMIN', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (174, 'locale_id', '3', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (175, 'agent', 't', 'admin');
INSERT INTO usrpref (usrpref_id, usrpref_name, usrpref_value, usrpref_username) VALUES (176, 'active', 't', 'admin');

ALTER TABLE usrpref ENABLE TRIGGER ALL;

--
-- Data for Name: xsltmap; Type: TABLE DATA; Schema: public; Owner: admin
--

ALTER TABLE xsltmap DISABLE TRIGGER ALL;

INSERT INTO xsltmap (xsltmap_id, xsltmap_name, xsltmap_doctype, xsltmap_system, xsltmap_import, xsltmap_export) VALUES (1, 'Yahoo', 'OrderList', 'http://store.yahoo.com/doc/dtd/OrderList2.dtd', 'yahoo_to_xtupleapi.xsl', '');

ALTER TABLE xsltmap ENABLE TRIGGER ALL;

/* grant privs now that they have all been defined ****************************/
SET search_path = public, pg_catalog;

do $$
  declare
    _row          record;
    _sequenceMax  bigint;
    _gltransMax   bigint = 1; -- gltrans and sltrans share
    _custMax      bigint = 1; -- custinfo and prospect share
  begin
    FOR _row IN
        SELECT nspname, relname, attname,
               TRIM(quote_literal('\"''') FROM
                    SUBSTRING(pg_catalog.pg_get_expr(d.adbin, d.adrelid)
                              FROM '[' || quote_literal('\"''') ||
                                   '].*[' || quote_literal('\"''') || ' ]')) AS seq
          FROM pg_catalog.pg_attribute a
          JOIN pg_catalog.pg_class     ON a.attrelid = pg_class.oid
          JOIN pg_catalog.pg_attrdef d ON d.adrelid = a.attrelid AND d.adnum = a.attnum
          JOIN pg_catalog.pg_namespace ON pg_namespace.oid = pg_class.relnamespace
          WHERE a.attnum > 0
            AND NOT a.attisdropped
            AND a.attnotnull
            AND pg_catalog.pg_get_expr(d.adbin, d.adrelid) ~* 'nextval'
            AND a.atthasdef
            AND nspname IN ('public', 'api')
            AND pg_class.oid NOT IN (SELECT inhrelid FROM pg_inherits)
    LOOP
      execute format('select max(%I) from %I.%I;',
                     _row.attname, _row.nspname, _row.relname) into _sequenceMax;
      if _row.relname = 'custinfo' or _row.relname = 'prospect' then 
        _custMax := greatest(_custMax, _sequenceMax);
        _sequenceMax := _custMax;
      elsif _row.relname = 'gltrans' or _row.relname = 'sltrans' then
        _gltransMax := greatest(_gltransMax, _sequenceMax);
        _sequenceMax := _gltransMax;
      end if;

      if _sequenceMax IS NOT NULL THEN
        perform pg_catalog.setval(_row.seq, _sequenceMax);
      else
        perform pg_catalog.setval(_row.seq, 1, false);
      end if;
    end loop;
  end;
$$ language plpgsql;

ALTER TABLE priv DISABLE TRIGGER ALL;
do $$
  /* DO block to hide the output */
  begin
  perform createPriv('Sales',       'AllowSelectOrderEditing',       'Users are allowed to edit some additional information on the Select Order for Billing screen.');
  perform createPriv('Sales',       'AlterPackDate',                 'Can Alter a Sales Order Pack Date');
  perform createPriv('Inventory',   'AlterTransactionDates',         'Can set the Transaction Date written to the G/L and Inventory History tables for inventory transactions.');
  perform createPriv('Accounting',  'ApplyAPMemos',                  'Can Apply A/P Memos');
  perform createPriv('Accounting',  'ApplyARMemos',                  'Can Apply A/R Credit/Demo Memos');
  perform createPriv('Sales',       'ArchiveSalesHistory',           'Can Archive Sales History');
  perform createPriv('Purchase',    'AssignItemsToPlannerCode',      'Can Assign Items to a Planner Code');
  perform createPriv('Sales',       'AssignPricingSchedules',        'Can Assign Pricing Schedules');
  perform createPriv('Accounting',  'ChangeARInvcDistDate',          'Can distribute an Invoice to the G/L using a date other than the Invoice Date');
  perform createPriv('Manufacture', 'ChangeNonPickItems',            'Can change the Issue Items Not On Pick List flag on Post Production.');
  perform createPriv('Accounting',  'ChangePORecvPostDate',          'Can post a Purchase Order Receipt to the G/L using a date other than the actual Receipt Date');
  perform createPriv('Purchase',    'ChangePurchaseOrderQty',        'Can Change Purchase Order Item Quantities');
  perform createPriv('Manufacture', 'ChangeReceiveInventory',        'Can change the Receive Inventory List flag on Post Operations.');
  perform createPriv('Accounting',  'ChangeSOMemoPostDate',          'Can post a Sales Order Credit Memo to the G/L using a date other than the Credit Memo Document Date');
  perform createPriv('Accounting',  'ChangeVOPostDate',              'Can post a Voucher to the G/L using a date other than the Voucher Distribution Date');
  perform createPriv('Manufacture', 'ChangeWorkOrderQty',            'Can Change Work Order Quantities');
  perform createPriv('CRM',         'CloseAllIncidents',             'Can Close all Incidents after confirming that it has been satisfactorily resolved');
  perform createPriv('CRM',         'ClosePersonalIncidents',        'Can Incidents when Owner or Assigned after confirming that it has been resolved');
  perform createPriv('Manufacture', 'CloseWorkOrders',               'Can Close Work Orders');
  perform createPriv('System',      'ConfigDatabaseInfo',            'Can Configure the Database Information');
  perform createPriv('System',      'ConfigureAP',                   'Can Configure the A/P Module');
  perform createPriv('System',      'ConfigureAR',                   'Can Configure the A/R Module');
  perform createPriv('System',      'ConfigureCC',                   'User is allowed to alter the Credit Card Configuration.');
  perform createPriv('System',      'ConfigureCRM',                  'Can change the CRM configuration module options.');
  perform createPriv('Sys',         'ConfigureEncryption',           'Allowed to view and change the Encryption Key File');
  perform createPriv('System',      'ConfigureGL',                   'Can Configure the G/L Module');
  perform createPriv('System',      'ConfigureIM',                   'Configure I/M Module Parameters');
  perform createPriv('System',      'ConfigureImportExport',         'Can Change or Create Settings For Importing and Exporting Data');
  perform createPriv('System',      'ConfigurePD',                   'Configure P/D Module Parameters');
  perform createPriv('System',      'ConfigurePM',                   'Users will be able to view and edit the configuration options for the P/M Module.');
  perform createPriv('System',      'ConfigurePO',                   'Configure P/O Module Parameters');
  perform createPriv('System',      'ConfigureSO',                   'Configure S/O Module Parameters');
  perform createPriv('System',      'ConfigureSR',                   'Configure S/R Module Parameters');
  perform createPriv('System',      'ConfigureWF',                   'Configure Workflow Parameters');
  perform createPriv('System',      'ConfigureWO',                   'Configure S/O Module Parameters');
  perform createPriv('Sales',       'ConvertQuotes',                 'Can Convert Quotes to Sales Orders');
  perform createPriv('Sales',       'ConvertQuotesInvoice',          'Can Convert Quote to Invoice.');
  perform createPriv('Inventory',   'CreateAdjustmentTrans',         'Can Create an Adjustment Transaction');
  perform createPriv('Products',    'CreateCosts',                   'Can Create User Costs');
  perform createPriv('Inventory',   'CreateExpenseTrans',            'Can Create an Expense Transaction');
  perform createPriv('Accounting',  'CreateNewCurrency',             'Create New Currencies');
  perform createPriv('Inventory',   'CreateReceiptTrans',            'Can Create a Misc. Receipt Transaction');
  perform createPriv('Sales',       'CreateSOForHoldCustomer',       'Can Create an Sales Order for a Customer on Credit Hold');
  perform createPriv('Sales',       'CreateSOForWarnCustomer',       'Can Create an Sales Order for a Customer on Credit Warning');
  perform createPriv('Sales',       'CreateSales',                   'Can Create Sales');
  perform createPriv('Inventory',   'CreateScrapTrans',              'Can Create a Scrap Transaction');
  perform createPriv('Products',    'DeleteCosts',                   'Can Delete Item Costs');
  perform createPriv('Inventory',   'DeleteCountSlips',              'Can Delete Count Slips');
  perform createPriv('Inventory',   'DeleteCountTags',               'Delete Count Tags');
  perform createPriv('Products',    'DeleteItemMasters',             'Can Delete Item Masters');
  perform createPriv('Inventory',   'DeleteItemSites',               'Can Delete Item Sites');
  perform createPriv('System',      'DeleteOtherEvents',             'Can Delete Other Users'' Events');
  perform createPriv('System',      'DeleteOwnEvents',               'Can Delete Own Events');
  perform createPriv('Accounting',  'DeletePostedJournals',          'Can delete posted Standard Journals and Journal Entries');
  perform createPriv('Manufacture', 'DeleteWorkOrders',              'Can Delete Open Work Orders');
  perform createPriv('System',      'DispatchOtherEvents',           'Can Dispatch Other User''s Events');
  perform createPriv('System',      'DispatchOwnEvents',             'Can Dispatch Own Events');
  perform createPriv('Accounting',  'EditAPOpenItem',                'Can Edit A/P Open Items');
  perform createPriv('Accounting',  'EditAROpenItem',                'Can Edit A/R Open Items');
  perform createPriv('System',      'EditOthersComments',            'User is allowed to edit any comments entered that are of an editable comment type.');
  perform createPriv('System',      'EditOwnComments',               'User is allowed to edit comments they have entered that are of an editable comment type.');
  perform createPriv('CRM',         'EditOwner',                     'Can Edit Owner in CRM documents');
  perform createPriv('Accounting',  'EditPostedJournals',            'Can edit posted Journal Entries');
  perform createPriv('Sales',       'EditSalesHistory',              'Can Edit Posted Sales History');
  perform createPriv('Products',    'EnterActualCosts',              'Can Enter Free Form Actual Costs');
  perform createPriv('Inventory',   'EnterCountSlips',               'Can Create and Enter Count Slips');
  perform createPriv('Inventory',   'EnterCountTags',                'Can Enter Count Tags');
  perform createPriv('Inventory',   'EnterMiscCounts',               'Can Enter Misc. Counts');
  perform createPriv('Inventory',   'EnterReceipts',                 'Can Enter Receipts');
  perform createPriv('Inventory',   'EnterReturns',                  'Can Enter Returns');
  perform createPriv('Inventory',   'EnterShippingInformation',      'Can Enter Shipping Information');
  perform createPriv('System',      'ExecuteMetaSQL',                'User is allowed to execute MetaSQL statements with the MetaSQL editor that change the database.');
  perform createPriv('Manufacture', 'ExplodeWorkOrders',             'Can Explode Work Orders');
  perform createPriv('System',      'ExportXML',                     'Can Export XML Files');
  perform createPriv('Sales',       'FirmSalesOrder',                'Can Firm a Sales Order line item to prevent editing');
  perform createPriv('System',      'FixSerial',                     'Can fix problems with serial values used to assign primary keys.');
  perform createPriv('Inventory',   'FreezeInventory',               'Can Freeze Inventory');
  perform createPriv('Manufacture', 'ImplodeWorkOrders',             'Can Implode Work Orders');
  perform createPriv('System',      'ImportXML',                     'Can Import Data From XML Sources');
  perform createPriv('Inventory',   'IssueCountTags',                'Can Issue Count Tags');
  perform createPriv('Inventory',   'IssueStockToShipping',          'Can Issue Stock to Shipping');
  perform createPriv('Manufacture', 'IssueWoMaterials',              'Can Issue Work Order Materials');
  perform createPriv('Accounting',  'MaintainAPMemos',               'Can Add/Edit/Post A/P Memos');
  perform createPriv('Accounting',  'MaintainARMemos',               'Can Add/Edit/Delete A/R Credit/Demo Memos');
  perform createPriv('Accounting',  'MaintainAccountingPeriods',     'Can Add/Edit/Delete Accounting Periods');
  perform createPriv('CRM',         'MaintainAddresses',             'Can Add/Edit/Delete Addresses');
  perform createPriv('Accounting',  'MaintainAdjustmentTypes',       'Can Add/Edit/Delete Adjustment Types');
  perform createPriv('CRM', 'MaintainAllCRMAccounts', 'Can Add/Edit/Delete all CRM Accounts');
  perform createPriv('CRM', 'MaintainAllContacts', 'Can Add/Edit/Delete all Contacts');
  perform createPriv('CRM', 'MaintainAllIncidents', 'Can Add/Edit/Delete all Incidents');
  perform createPriv('CRM', 'MaintainAllOpportunities', 'Can Add/Edit/Delete all Opportunities');
  perform createPriv('CRM', 'MaintainAllProjects', 'Can Add/Edit/Delete all Projects');
  perform createPriv('CRM', 'MaintainAllToDoItems', 'Can Add/Edit/Delete all ToDoItems');
  perform createPriv('Products',    'MaintainBOMs',                  'Can Add/Edit/Delete Bills of Materials');
  perform createPriv('System',      'MaintainBankAccounts',          'Can Add/Edit/Delete Bank Accounts');
  perform createPriv('Accounting',  'MaintainBankAdjustments',       'Can Add/Edit/Delete Bank Adjustments');
  perform createPriv('Accounting',  'MaintainBankRec',               'Can Maintain Bank Reconciliations');
  perform createPriv('Accounting',  'MaintainBudgets',               'Can maintain budget information');
  perform createPriv('System',      'MaintainCalendars',             'Can Add/Edit/Delete Calendars');
  perform createPriv('Inventory',   'MaintainCarriers',              'Can Add/Edit/Delete Shippers');
  perform createPriv('Accounting',  'MaintainCashReceipts',          'Can Add/Edit/Delete Cash Receipts');
  perform createPriv('Inventory',   'MaintainCharacteristics',       'Can Add/Edit/Delete Characteristics');
  perform createPriv('Accounting',  'MaintainChartOfAccounts',       'Can Add/Edit/Delete Accounts in the Chart of Accounts');
  perform createPriv('Accounting',  'MaintainCheckFormats',          'Can Add/Edit/Delete A/P Check Formats');
  perform createPriv('Products',    'MaintainClassCodes',            'Can Add/Edit/Delete Class Codes');
  perform createPriv('System',      'MaintainCommentTypes',          'Can Add/Edit/Delete Comment Types');
  perform createPriv('CRM',         'MaintainCompetitorMasters',     'Can Add/Edit/Delete Competitor Masters');
  perform createPriv('Inventory',   'MaintainCostCategories',        'Can Add/Edit/Delete Cost Categories');
  perform createPriv('System',      'MaintainCountries',             'Can Add/Edit/Delete Country information.');
  perform createPriv('Sales',       'MaintainCreditMemos',           'Can Add/Edit/Delete Unposted Credit Memos');
  perform createPriv('Accounting',  'MaintainCurrencies',            'Modify Existing Currencies');
  perform createPriv('Accounting',  'MaintainCurrencyRates',         'Add and Modify Currency Exchange Rates');
  perform createPriv('System',      'MaintainCustomCommands',        'User can Create/Edit/View Custom commands');
  perform createPriv('Sales',       'MaintainCustomerGroups',        'Can Add/Edit/Delete/Modify Customer Groups');
  perform createPriv('Sales',       'MaintainCustomerMasters',       'Can Add/Edit/Delete Customer Masters');
  perform createPriv('Sales',       'MaintainCustomerMastersCustomerType',        'Users are allowed to edit the Customer Type for a customer.');
  perform createPriv('Sales',       'MaintainCustomerMastersCustomerTypeOnCreate','Users are allowed to edit the Customer Type for a customer when creating a new customer.');
  perform createPriv('Sales',       'MaintainCustomerTypes',         'Can Add/Edit/Delete Customer Types');
  perform createPriv('System',      'MaintainDepartments',           'Can create and modify Department definitions.');
  perform createPriv('Inventory',   'MaintainDestinations',          'Can Add/Edit/Delete Destinations');
  perform createPriv('System',      'MaintainDictionaries',          'User is allowed to maintain/download spell check dictionaries to their local computer.');
  perform createPriv('System',      'MaintainEmployeeGroups',        'Can Change or Create Employee Groups.');
  perform createPriv('System',      'MaintainEmployees',             'Can Change or Create Employee records.');
  perform createPriv('Misc.',       'MaintainExpenseCategories',     'Can Add/Edit/Delete Expense Categories');
  perform createPriv('Inventory',   'MaintainExternalShipping',      'Can Change or Create External Shipping Records.');
  perform createPriv('Accounting',  'MaintainFinancialLayouts',      'Can Add/Edit/Delete Financial Layouts');
  perform createPriv('System',      'MaintainForms',                 'Can Add/Edit/Delete Forms');
  perform createPriv('Products',    'MaintainFreightClasses',        'Can Add/Edit/Delete Freight Classes');
  perform createPriv('System',      'MaintainGroups',                'Can Change or Create Settings For Groups');
  perform createPriv('System',      'MaintainImages',                'Can Add/Edit/Delete Images');
  perform createPriv('CRM',         'MaintainIncidentCategories',    'Can Add/Edit/Delete Incident Categories');
  perform createPriv('CRM',         'MaintainIncidentPriorities',    'Can Add/Edit/Delete Incident Priorities');
  perform createPriv('CRM',         'MaintainIncidentResolutions',   'Can Add/Edit/Delete Incident Resolutions');
  perform createPriv('CRM',         'MaintainIncidentSeverities',    'Can Add/Edit/Delete Incident Severities');
  perform createPriv('Products',    'MaintainItemGroups',            'Can Add/Edit/Delete Item Groups');
  perform createPriv('Products',    'MaintainItemMasters',           'Can Add/Edit/Delete Item Masters');
  perform createPriv('Inventory',   'MaintainItemSites',             'Can Add/Edit/Delete Item Sites');
  perform createPriv('Purchase',    'MaintainItemSources',           'Can Add/Edit/Delete P/O Item Sources');
  perform createPriv('Sales',       'MaintainListPrices',            'Can Modify List Prices');
  perform createPriv('System',      'MaintainLocales',               'Can Add/Edit/Delete Locales');
  perform createPriv('Inventory',   'MaintainLocations',             'Can Add/Edit/Delete Warehouse Locations');
  perform createPriv('System',      'MaintainMetaSQL',               'User is allowed to edit MetaSQL statements with the MetaSQL editor.');
  perform createPriv('Accounting',  'MaintainMiscInvoices',          'Can Add/Edit/Delete Misc. Invoices');
  perform createPriv('CRM',         'MaintainOpportunitySources',    'Can Add/Edit/Delete Opportunity Sources');
  perform createPriv('CRM',         'MaintainOpportunityStages',     'Can Add/Edit/Delete Opportunity Stages');
  perform createPriv('CRM',         'MaintainOpportunityTypes',      'Can Add/Edit/Delete Opportunity Types');
  perform createPriv('Inventory',   'MaintainPackingListBatch',      'Can Modify Packing List Batch');
  perform createPriv('CRM',         'MaintainPartners',              'Can Add/Edit/Delete Partner Masters');
  perform createPriv('Accounting',  'MaintainPayments',              'Can Maintain Payment and Check information.');
  perform createPriv('CRM', 'MaintainPersonalCRMAccounts', 'Can Add/Edit/Delete CRM Accounts when Owner or Assigned');
  perform createPriv('CRM', 'MaintainPersonalContacts', 'Can Add/Edit/Delete Contacts when Owner or Assigned');
  perform createPriv('CRM', 'MaintainPersonalIncidents', 'Can Add/Edit/Delete Incidents when Owner or Assigned');
  perform createPriv('CRM', 'MaintainPersonalOpportunities', 'Can Add/Edit/Delete Opportunities when Owner or Assigned');
  perform createPriv('CRM', 'MaintainPersonalProjects', 'Can Add/Edit/Delete Projects when Owner or Assigned');
  perform createPriv('CRM', 'MaintainPersonalToDoItems', 'Can Add/Edit/Delete ToDoItems when Owner or Assigned');
  perform createPriv('Purchase',    'MaintainPlannerCodes',          'Can Add/Edit/Delete Planner Codes');
  perform createPriv('Purchase',    'MaintainPostedPurchaseOrders',  'Can Edit Purchase Orders which have already been Posted');
  perform createPriv('System',      'MaintainPreferencesOthers',     'Can Maintain the preferences of other users.');
  perform createPriv('System',      'MaintainPreferencesSelf',       'Can Maintain the preferences for their own user only.');
  perform createPriv('Sales',       'MaintainPricingSchedules',      'Can Add/Edit/Delete Pricing Schedules');
  perform createPriv('Products',    'MaintainProductCategories',     'Add/Edit/Delete Product Categories');
  perform createPriv('CRM',         'MaintainProjectTypes',          'Maintain Project Types');
  perform createPriv('Sales',       'MaintainProspectMasters',       'Can Add/Edit/Delete Prospect information.');
  perform createPriv('Purchase',    'MaintainPurchaseOrders',        'Can Add/Edit/Delete Purchase Orders');
  perform createPriv('Purchase',    'MaintainPurchaseRequests',      'Can Add/Edit/Delete Purchase Requests');
  perform createPriv('Sales',       'MaintainQuotes',                'Can Add/Edit/Delete Quotes');
  perform createPriv('Accounting',  'MaintainReasonCodes',           'User is allowed to maintain the Reason Codes.');
  perform createPriv('System',      'MaintainRegistrationKey',       'Can Configure the Registration Key.');
  perform createPriv('Purchase',    'MaintainRejectCodes',           'Can Add/Edit/Delete Reject Codes');
  perform createPriv('System',      'MaintainReports',               'Can Add/Edit/Delete Reports');
  perform createPriv('Sales',       'MaintainSaleTypes',             'Can Add/Edit/Delete Sale Types.');
  perform createPriv('Sales',       'MaintainSalesAccount',          'Can Add/Edit/Delete Sales Account Assignments');
  perform createPriv('Misc.',       'MaintainSalesCategories',       'Can Add/Edit/Delete Sales Categories');
  perform createPriv('Sales',       'MaintainSalesOrders',           'Can Add/Edit/Delete Sales Orders');
  perform createPriv('Sales',       'MaintainSalesReps',             'Can Add/Edit/Delete Sales Reps.');
  perform createPriv('System',      'MaintainScreens',               'Can Change or Create UI Forms that are executed by custom windows when they are opened.');
  perform createPriv('System',      'MaintainScripts',               'Can Change or Create Scripts that are executed by windows when they are opened.');
  perform createPriv('Sales',       'MaintainShipVias',              'Can Add/Edit/Delete Ship Via''s');
  perform createPriv('Misc.',       'MaintainShippingChargeTypes',   'Can Add/Edit/Delete Shipping Charge Types');
  perform createPriv('Sales',       'MaintainShippingForms',         'Can Add/Edit/Delete Shipping Forms');
  perform createPriv('Sales',       'MaintainShippingZones',         'Can Add/Edit/Delete Shipping Zones');
  perform createPriv('Sales',       'MaintainShiptos',               'Can Add/Edit/Delete Ship-Tos');
  perform createPriv('Inventory',   'MaintainSiteTypes',             'Can Change or Create Settings For Site Types');
  perform createPriv('Accounting',  'MaintainStandardJournalGroups', 'Can Add/Edit/Delete Standard Journal Groups');
  perform createPriv('Accounting',  'MaintainStandardJournals',      'Can Add/Edit/Delete Standard Journals');
  perform createPriv('System',      'MaintainStates',                'User is allowed to edit the list of States and Provinces');
  perform createPriv('Accounting',  'MaintainTaxAssignments',        'Can Add/Edit/Delete Tax Assignments');
  perform createPriv('Accounting',  'MaintainTaxAuthorities',        'Can Add/Edit/Delete Tax Authorities.');
  perform createPriv('Accounting',  'MaintainTaxClasses',            'Can Add/Edit/Delete Tax Classes');
  perform createPriv('Sales',       'MaintainTaxCodes',              'Can Add/Edit/Delete Tax Codes');
  perform createPriv('Accounting',  'MaintainTaxReconciliations',    'Can Add/Edit/Delete unposted Tax Reconciliation records and associated data.');
  perform createPriv('Accounting',  'MaintainTaxRegistrations',      'Can Add/Edit/Delete Tax Registrations.');
  perform createPriv('Accounting',  'MaintainTaxTypes',              'Can Add/Edit/Delete Tax Types.');
  perform createPriv('Accounting',  'MaintainTaxZones',              'Can Add/Edit/Delete Tax Zones');
  perform createPriv('Accounting',  'MaintainTerms',                 'Can Add/Edit/Delete Terms');
  perform createPriv('CRM',         'MaintainTitles',                'Can Add/Edit/Delete Titles (Honorifics).');
  perform createPriv('System',      'MaintainTranslations',          'User is allowed to maintain/download translations to their local computer.');
  perform createPriv('Products',    'MaintainUOMs',                  'Can Add/Edit/Delete Unit of Measures');
  perform createPriv('Purchase',    'MaintainUninvoicedReceipts',    'Can Mark as invoiced and Correct Receiving on uninvoiced receipts');
  perform createPriv('Products',    'MaintainUserCostingElements',   'Can Add/Edit/Delete User Costing Elements');
  perform createPriv('System',      'MaintainUsers',                 'Can Add/Edit/List Users');
  perform createPriv('Accounting',  'MaintainVendorAccounts',        'Can Add/Edit/Delete Vendor Account Assignments');
  perform createPriv('Purchase',    'MaintainVendorAddresses',       'Can Add/Edit/Delete Vendor Addresses');
  perform createPriv('Purchase',    'MaintainVendorTypes',           'Can Add/Edit/Delete Vendor Types');
  perform createPriv('Purchase',    'MaintainVendors',               'Can Add/Edit/Delete Vendors');
  perform createPriv('Accounting',  'MaintainVouchers',              'Can Add/Edit/Delete Vouchers');
  perform createPriv('Inventory',   'MaintainWarehouses',            'Can Add/Edit/Delete Warehouses');
  perform createPriv('CRM',         'MaintainWarrantyTerms',         'Can Add/Edit/Delete Warranty Terms');
  perform createPriv('Manufacture', 'MaintainWoMaterials',           'Can Add/Edit/Delete Work Order Materials');
  perform createPriv('Manufacture', 'MaintainWorkOrders',            'Can Add/Edit/Delete Work Orders');
  perform createPriv('CRM',         'MergeContacts',                 'Can use Contact Merge utility');
  perform createPriv('Sales',       'OverridePrice',                 'Can Override Item Sales Prices');
  perform createPriv('Sales',       'OverrideSODate',                'Can Override S/O Enter Dates');
  perform createPriv('Accounting',  'OverrideTax',                   'Can manually override the system-selected Tax Code and/or tax % for individual Invoice line items.');
  perform createPriv('Accounting',  'PostARDocuments',               'Can Post Invoices and Credit Memos');
  perform createPriv('Products',    'PostActualCosts',               'Can Post Actual Costs to Standard Costs');
  perform createPriv('Accounting',  'PostBankAdjustments',           'Can Post Bank Adjustments');
  perform createPriv('Accounting',  'PostCashReceipts',              'Can Post Cash Receipts');
  perform createPriv('Inventory',   'PostCountSlips',                'Can Post Count Slips');
  perform createPriv('Inventory',   'PostCountTags',                 'Can Post Count Tags');
  perform createPriv('Accounting',  'PostFrozenPeriod',              'Can Post into frozen Accounting Period');
  perform createPriv('Accounting',  'PostJournalEntries',            'Can Post Journal Entries');
  perform createPriv('Accounting',  'PostJournals',                  'Can post Journals');
  perform createPriv('Accounting',  'PostMiscInvoices',              'Can Post Misc. Invoices');
  perform createPriv('Manufacture', 'PostMiscProduction',            'Can Make Miscellaneous Production Postings');
  perform createPriv('Accounting',  'PostPayments',                  'Can Post Payments/Checks.');
  perform createPriv('Manufacture', 'PostProduction',                'Can Post Production');
  perform createPriv('Products',    'PostStandardCosts',             'Can Post Product Standard Costs');
  perform createPriv('Accounting',  'PostStandardJournalGroups',     'Can Post Standard Journal Groups');
  perform createPriv('Accounting',  'PostStandardJournals',          'Can Post Standard Journals');
  perform createPriv('Accounting',  'PostVouchers',                  'Can Post Vouchers');
  perform createPriv('Accounting',  'PrintAPJournals',               'Can view A/P Open Item infomation and related screens that use that information.');
  perform createPriv('Accounting',  'PrintARJournals',               'Can view A/R Open Item infomation and related screens that use that information.');
  perform createPriv('Inventory',   'PrintBillsOfLading',            'Can Print Bills of Lading');
  perform createPriv('Sales',       'PrintCreditMemos',              'Print Credit Memos');
  perform createPriv('Accounting',  'PrintInvoices',                 'Can Print Invoices');
  perform createPriv('Sales',       'PrintPackingLists',             NULL);
  perform createPriv('Purchase',    'PrintPurchaseOrders',           'Can Print Purchase Orders');
  perform createPriv('Sales',       'PrintQuotes',                   'Can Print Quotes');
  perform createPriv('Manufacture', 'PrintWorkOrderPaperWork',       'Can Print Work Order Paper Work');
  perform createPriv('Accounting',  'ProcessCreditCards',            'Can Process Credit Card Transactions');
  perform createPriv('Inventory',   'PurgeCountSlips',               'Can Purge Posted Count Slips');
  perform createPriv('Inventory',   'PurgeCountTags',                'Cost Purge Posted Count Tags');
  perform createPriv('Sales',       'PurgeCreditMemos',              'Purge Credit Memos');
  perform createPriv('Sales',       'PurgeInvoices',                 'Purge Invoices');
  perform createPriv('Inventory',   'PurgeShippingRecords',          'Can Purge Shipping Records');
  perform createPriv('Manufacture', 'PurgeWorkOrders',               'Can Purge Closed Work Orders');
  perform createPriv('CRM',         'ReassignToDoItems',             'Can Reassign ToDoItems to other people');
  perform createPriv('Inventory',   'RecallInvoicedShipment',        'Can recall shipments that have already been invoiced.');
  perform createPriv('Inventory',   'RecallOrders',                  'Can Recall Orders to Shipping');
  perform createPriv('Manufacture', 'RecallWorkOrders',              'Can Recall Work Orders');
  perform createPriv('Purchase',    'ReleasePurchaseOrders',         'Can Release Purchase Orders');
  perform createPriv('Manufacture', 'ReleaseWorkOrders',             'Can Release Work Orders');
  perform createPriv('Inventory',   'RelocateInventory',             'Can Relocate Inventory');
  perform createPriv('Manufacture', 'ReprioritizeWorkOrders',        'Can Reprioritize Work Orders');
  perform createPriv('Purchase',    'ReschedulePurchaseOrders',      'Can Reschedule Purchase Orders');
  perform createPriv('Manufacture', 'RescheduleWorkOrders',          'Can Reschedule Work Orders');
  perform createPriv('Sales',       'RestoreSalesHistory',           'Can Restore Sales History');
  perform createPriv('Inventory',   'ReturnStockFromShipping',       'Can Return Stock from Shipping');
  perform createPriv('Manufacture', 'ReturnWoMaterials',             'Can Return Work Order Materials');
  perform createPriv('Manufacture', 'ScrapWoMaterials',              NULL);
  perform createPriv('Sales',       'SelectBilling',                 'Can Select an Order for Billing');
  perform createPriv('Inventory',   'ShipOrders',                    'Can Ship Orders from Shipping');
  perform createPriv('Sales',       'ShowMarginsOnSalesOrder',       'Users will see the margins on the Sales Order and Quote Screens for that older.');
  perform createPriv('Inventory',   'SummarizeInventoryTransactions', 'Can Summarized Inventory Transactions');
  perform createPriv('Accounting',  'SynchronizeCompanies',          'Can run company trial balance synchronization utility.');
  perform createPriv('Inventory',   'ThawInventory',                 'Can Thaw Inventory');
  perform createPriv('Purchase',    'UnreleasePurchaseOrders',       'Can Unrelease Purchase Orders.');
  perform createPriv('Inventory',   'UpdateABCClass',                'Can Run Update ABC Class Utility');
  perform createPriv('Products',    'UpdateActualCosts',             'Can Update Actual Costs via P/O or P/D');
  perform createPriv('Sales',       'UpdateCustomerCreditStatus',    'Can Update a Customer''s Credit Status');
  perform createPriv('Inventory',   'UpdateCycleCountFreq',          'Can Update an Item Site''s Cycle Count Frequency');
  perform createPriv('Inventory',   'UpdateLeadTime',                'Can Update an Item Site''s Lead Time');
  perform createPriv('Inventory',   'UpdateOUTLevels',               'Can Update Order Up To Levels');
  perform createPriv('Sales',       'UpdatePricingSchedules',        'Can Update Pricing Schedules');
  perform createPriv('Inventory',   'UpdateReorderLevels',           'Can Update Reorder Levels');
  perform createPriv('Accounting',  'ViewAPMemos',                   'Can View A/P Memos');
  perform createPriv('Accounting',  'ViewAPOpenItems',               'Can view A/P Open Item infomation and related screens that use that information.');
  perform createPriv('Accounting',  'ViewARMemos',                   'Can View A/R Credit/Demo Memos');
  perform createPriv('Accounting',  'ViewAROpenItems',               'Can view A/R Open Item infomation and related screens that use that information.');
  perform createPriv('Accounting',  'ViewAccountingPeriods',         'Can View Accounting Periods');
  perform createPriv('CRM',         'ViewAddresses',                 'Can View Addresses');
  perform createPriv('Accounting',  'ViewAdjustmentTypes',           'Can View Adjustment Types');
  perform createPriv('CRM', 'ViewAllCRMAccounts', 'Can View all CRM Accounts');
  perform createPriv('CRM', 'ViewAllContacts', 'Can View all Contacts');
  perform createPriv('CRM', 'ViewAllIncidents', 'Can View all Incidents');
  perform createPriv('CRM', 'ViewAllOpportunities', 'Can View all Opportunities');
  perform createPriv('CRM', 'ViewAllProjects', 'Can View all Projects');
  perform createPriv('CRM', 'ViewAllToDoItems', 'Can View all ToDoItems');
  perform createPriv('Products',    'ViewBOMs',                      'Can View Bills of Materials');
  perform createPriv('Accounting',  'ViewBankAdjustments',           'Can View Bank Adjustments');
  perform createPriv('Accounting',  'ViewBankRec',                   'Can View Bank Reconciliation Information');
  perform createPriv('Accounting',  'ViewBudgets',                   'Can view budget information, not affecting FRE ability to view budgets.');
  perform createPriv('Purchase',    'ViewBuyCard',                   'Can View Buy Cards');
  perform createPriv('Inventory',   'ViewCarriers',                  'Can View Shippers');
  perform createPriv('Accounting',  'ViewCashReceipts',              'Can View Cash Receipts');
  perform createPriv('Purchase',    'ViewCashRequirements',          'Can View Cash Requirements');
  perform createPriv('Inventory',   'ViewCharacteristics',           'Can View Characteristics');
  perform createPriv('Accounting',  'ViewCheckFormats',              'Can View A/P Check Formats');
  perform createPriv('Products',    'ViewClassCodes',                'Can View Class Codes');
  perform createPriv('CRM',         'ViewCommLog',                   'Can View the Communications Log');
  perform createPriv('Sales',       'ViewCommissions',               'Can View Earned Commissions');
  perform createPriv('CRM',         'ViewCompetitorMasters',         'Can View Competitor Masters');
  perform createPriv('Inventory',   'ViewCostCategories',            'Can View Cost Categories');
  perform createPriv('Products',    'ViewCosts',                     'Can View Actual and Standard Costs');
  perform createPriv('Inventory',   'ViewCountTags',                 'View Count Tags');
  perform createPriv('Sales',       'ViewCreditMemos',               'Can View Unposted Credit Memos');
  perform createPriv('Accounting',  'ViewCurrencyRates',             'View Currency Exchange Rates');
  perform createPriv('Sales',       'ViewCustomerGroups',            'Can View Customer Groups');
  perform createPriv('Sales',       'ViewCustomerMasters',           'Can View Customer Masters');
  perform createPriv('Sales',       'ViewCustomerPrices',            'Can View Customer Type Prices');
  perform createPriv('Sales',       'ViewCustomerTypes',             'Can View Customer Types');
  perform createPriv('System',      'ViewDepartments',               'Can view Department definitions.');
  perform createPriv('Accounting',  'ViewDepositsRegister',          'Can view the Deposits Register.');
  perform createPriv('Inventory',   'ViewDestinations',              'Can View Destinations');
  perform createPriv('System',      'ViewEmployeeGroups',            'Can view Employee Group records.');
  perform createPriv('System',      'ViewEmployees',                 'Can view Employee records.');
  perform createPriv('Misc.',       'ViewExpenseCategories',         'Can View Expense Categories');
  perform createPriv('Accounting',  'ViewFinancialLayouts',          'Can View Financial Layouts');
  perform createPriv('Accounting',  'ViewFinancialReports',          'Can View Financial Reports');
  perform createPriv('Products',    'ViewFreightClasses',            'Can View Freight Classes');
  perform createPriv('Accounting',  'ViewGLTransactions',            'Can View G/L Transactions');
  perform createPriv('Inventory',   'ViewInventoryAvailability',     'Can View Inventory Availability');
  perform createPriv('Inventory',   'ViewInventoryHistory',          'Can View Inventory History');
  perform createPriv('Inventory',   'ViewInventoryValue',            'Can View Inventory Values');
  perform createPriv('Accounting',  'ViewInvoiceRegister',           'Can view the Invoice Register.');
  perform createPriv('Inventory',   'ViewItemAvailabilityWorkbench', 'Can View Item Availability Workbench.');
  perform createPriv('Products',    'ViewItemMasters',               'Can View Item Masters');
  perform createPriv('Products',    'ViewItemOptions',               'Can View Item Options');
  perform createPriv('Inventory',   'ViewItemSites',                 'Can View Item Sites');
  perform createPriv('Purchase',    'ViewItemSources',               'Can View P/O Item Sources');
  perform createPriv('Accounting',  'ViewJournals',                  'Can view Journals');
  perform createPriv('Sales',       'ViewListPrices',                'Can View List Prices');
  perform createPriv('Inventory',   'ViewLocations',                 'Can View Warehouse Locations');
  perform createPriv('Manufacture', 'ViewMaterialVariances',         'Can View W/O Material Variances');
  perform createPriv('System',      'ViewMetaSQL',                   'User is allowed to view MetaSQL statements with the MetaSQL editor.');
  perform createPriv('Accounting',  'ViewMiscInvoices',              'Can View Misc. Invoices');
  perform createPriv('System',      'ViewOtherEvents',               'Can View Other User''s Events');
  perform createPriv('System',      'ViewPackages',                  'Can View installed Packages.');
  perform createPriv('Inventory',   'ViewPackingListBatch',          'Can View Packing List Batch');
  perform createPriv('CRM',         'ViewPartners',                  'Can View Partner Masters');
  perform createPriv('CRM', 'ViewPersonalCRMAccounts', 'Can View CRM Accounts when Owner or Assigned');
  perform createPriv('CRM', 'ViewPersonalContacts', 'Can View Contacts when Owner or Assigned');
  perform createPriv('CRM', 'ViewPersonalIncidentHistory', 'Can View Incident History when Owner or Assigned');
  perform createPriv('CRM', 'ViewPersonalIncidents', 'Can View Incidents when Owner or Assigned');
  perform createPriv('CRM', 'ViewPersonalOpportunities', 'Can View Opportunities when Owner or Assigned');
  perform createPriv('CRM', 'ViewPersonalProjects', 'Can View Projects when Owner or Assigned');
  perform createPriv('CRM', 'ViewPersonalToDoItems', 'Can View ToDoItems when Owner or Assigned');
  perform createPriv('Purchase',    'ViewPlannerCodes',              'Can View Planner Codes');
  perform createPriv('Sales',       'ViewPricingSchedules',          'Can View Pricing Schedules');
  perform createPriv('Products',    'ViewProductCategories',         'Can View Product Categories');
  perform createPriv('Sales',       'ViewProspectMasters',           'Can View Prospect information.');
  perform createPriv('Purchase',    'ViewPurchaseOrders',            'Can View Orders');
  perform createPriv('Purchase',    'ViewPurchaseRequests',          'Can View Purchase Requests');
  perform createPriv('Inventory',   'ViewQOH',                       'Can View QOH');
  perform createPriv('Sales',       'ViewQuotes',                    'Can View Quotes');
  perform createPriv('Purchase',    'ViewReceiptsReturns',           'View Receipts and Returns');
  perform createPriv('Purchase',    'ViewRejectCodes',               'Can View Reject Codes');
  perform createPriv('Sales',       'ViewSaleTypes',                 'Can View Sale Types.');
  perform createPriv('Sales',       'ViewSalesAccount',              'Can View Sales Account Assignments');
  perform createPriv('Misc.',       'ViewSalesCategories',           'Can View Sales Categories');
  perform createPriv('Sales',       'ViewSalesHistory',              NULL);
  perform createPriv('Sales',       'ViewSalesOrders',               'Can View Sales Orders');
  perform createPriv('Sales',       'ViewSalesReps',                 'Can View Sales Reps.');
  perform createPriv('System',      'ViewShifts',                    'Can view Shift definitions.');
  perform createPriv('Sales',       'ViewShipVias',                  'Can View Ship Via''s');
  perform createPriv('Inventory',   'ViewShipping',                  'Can View Stock at Shipping');
  perform createPriv('Misc.',       'ViewShippingChargeTypes',       'Can View Shipping Charge Types');
  perform createPriv('Sales',       'ViewShippingZones',             'Can View Shipping Zones');
  perform createPriv('Sales',       'ViewShiptos',                   'Can View Ship-Tos');
  perform createPriv('Inventory',   'ViewSiteTypes',                 'Can View Settings For Site Types');
  perform createPriv('Accounting',  'ViewStandardJournalGroups',     'Can View Standard Journal Groups');
  perform createPriv('Accounting',  'ViewStandardJournals',          'Can View Standard Journals');
  perform createPriv('Accounting',  'ViewTaxAssignments',            'Can View Tax Assignments');
  perform createPriv('Accounting',  'ViewTaxAuthorities',            'Can View Tax Authorities.');
  perform createPriv('Accounting',  'ViewTaxClasses',                'Can view Tax Classes');
  perform createPriv('Sales',       'ViewTaxCodes',                  'Can View Tax Codes');
  perform createPriv('Accounting',  'ViewTaxReconciliations',        'Can View Tax Reconciliation records and associated data.');
  perform createPriv('Accounting',  'ViewTaxRegistrations',          'Can View Tax Registrations.');
  perform createPriv('Accounting',  'ViewTaxTypes',                  'Can View Tax Types.');
  perform createPriv('Accounting',  'ViewTaxZones',                  'Can view Tax Zones');
  perform createPriv('Sales',       'ViewTerms',                     'Can View Terms');
  perform createPriv('CRM',         'ViewTitles',                    'Can View Titles (Honorifics).');
  perform createPriv('Accounting',  'ViewTrialBalances',             'Can View Trial Balances');
  perform createPriv('Products',    'ViewUOMs',                      'Can View Unit of Measures');
  perform createPriv('Purchase',    'ViewUninvoicedReceipts',        'User is allowed to View Uninvoiced Receivings.');
  perform createPriv('Accounting',  'ViewVendorAccounts',            'Can View Vendor Account Assignments');
  perform createPriv('Purchase',    'ViewVendorAddresses',           'Can View Vendor Addresses');
  perform createPriv('Purchase',    'ViewVendorPerformance',         'Can View Vendor Performance');
  perform createPriv('Purchase',    'ViewVendorTypes',               'Can View Vendor Types');
  perform createPriv('Purchase',    'ViewVendors',                   'Can View Vendors');
  perform createPriv('Accounting',  'ViewVouchers',                  'Can View Vouchers');
  perform createPriv('Inventory',   'ViewWarehouses',                'Can View Warehouses');
  perform createPriv('CRM',         'ViewWarrantyTerms',             'Can View Warranty Terms');
  perform createPriv('Manufacture', 'ViewWoMaterials',               'Can View Work Order Materials');
  perform createPriv('Manufacture', 'ViewWorkOrders',                'Can View Work Orders');
  perform createPriv('Accounting',  'VoidPostedAPCheck',             'Can void a posted A/P Check.');
  perform createPriv('Accounting',  'VoidPostedARCreditMemos',       'Can void posted A/R Credit Memos.');
  perform createPriv('Accounting',  'VoidPostedCashReceipts',        'Can void posted A/R Cash Receipts.');
  perform createPriv('Accounting',  'VoidPostedInvoices',            'Can void posted A/R Invoices.');
  perform createPriv('Accounting',  'VoidPostedVouchers',            'Can void posted A/P Vouchers.');
  perform createPriv('Inventory',   'ZeroCountTags',                 'Can Zero Uncounted Count Tags');
  perform createPriv('System',      'fixACL',                        'Can fix Access Control List problems at the database level.');

  update priv set priv_seq = 0 where priv_name in (
    'MaintainAllCRMAccounts', 'MaintainAllContacts', 'MaintainAllIncidents',
    'MaintainAllOpportunities', 'MaintainAllProjects', 'MaintainAllToDoItems');

  update priv set priv_seq = 1 where priv_name in (
    'ViewAllCRMAccounts', 'ViewAllContacts', 'ViewAllIncidents',
    'ViewAllOpportunities', 'ViewAllProjects', 'ViewAllToDoItems');

  update priv set priv_seq = 2 where priv_name in (
    'MaintainPersonalCRMAccounts', 'MaintainPersonalContacts', 'MaintainPersonalIncidents',
    'MaintainPersonalOpportunities', 'MaintainPersonalProjects', 'MaintainPersonalToDoItems');

  update priv set priv_seq = 4 where priv_name in (
    'ViewPersonalCRMAccounts', 'ViewPersonalContacts', 'ViewPersonalIncidents', 'ViewPersonalIncidentHistory',
    'ViewPersonalOpportunities', 'ViewPersonalProjects', 'ViewPersonalToDoItems');
  end;
$$ language plpgsql;

ALTER TABLE priv ENABLE TRIGGER ALL;

ALTER TABLE usrpriv DISABLE TRIGGER ALL;

/* DO block so we don't have to page through the output */
do $$
  declare
    _id integer;
  begin
    select grp_id into _id from grp where grp_name = 'ADMIN';
    perform grantPrivGroup(_id, priv_id) from priv;

    /* Assign ADMIN group to default admin user accounts */
    PERFORM grantgroup('admin',    _id);
    PERFORM grantgroup('mfgadmin', _id);
  end;
$$ language plpgsql;

ALTER TABLE usrpriv ENABLE TRIGGER ALL;
