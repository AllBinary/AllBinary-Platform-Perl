#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::business::user::commerce::money::payment::gateway::modules::processor::echo::EchoPaymentGatewayData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $TRANSACTION_TYPE = "transaction_type";
our $MERCHANT_ECHO_ID = "merchant_echo_id";
our $ORDER_TYPE = "order_type";
our $MERCHANT_PIN = "merchant_pin";
our $ISP_ECHO_ID = "isp_echo_id";
our $ISP_PIN = "isp_pin";
our $BILLING_IP_ADDRESS = "billing_ip_address";
our $MERCHANT_EMAIL = "merchant_email";
our $AUTHORIZATION = "authorization";
our $BILLING_PREFIX = "billing_prefix";
our $BILLING_NAME = "billing_name";
our $BILLING_FIRST_NAME = "billing_first_name";
our $BILLING_LAST_NAME = "billing_last_name";
our $BILLING_COMPANY_NAME = "billing_company_name";
our $BILLING_ADDRESS1 = "billing_address1";
our $BILLING_ADDRESS2 = "billing_address2";
our $BILLING_CITY = "billing_city";
our $BILLING_STATE = "billing_state";
our $BILLING_ZIP = "billing_zip";
our $BILLING_COUNTRY = "billing_country";
our $BILLING_PHONE = "billing_phone";
our $BILLING_FAX = "billing_fax";
our $BILLING_EMAIL = "billing_email";
our $CC_NUMBER = "cc_number";
our $CCEXP_MONTH = "ccexp_month";
our $CCEXP_YEAR = "ccexp_year";
our $CNP_RECURRING = "cnp_recurring";
our $cnp_security = "cnp_security";
our $COUNTER = "counter";
our $DEBUG = "debug";
our $EC_ACCOUNT = "ec_account";
our $EC_ACCOUNT_TYPE = "ec_account_type";
our $EC_ADDRESS1 = "ec_address1";
our $EC_ADDRESS2 = "ec_address2";
our $EC_BANK_NAME = "ec_bank_name";
our $EC_CITY = "ec_city";
our $EC_EMAIL = "ec_email";
our $EC_FIRST_NAME = "ec_first_name";
our $EC_ID_COUNTRY = "ec_id_country";
our $EC_ID_EXP_MM = "ec_id_exp_mm";
our $EC_ID_EXP_DD = "ec_id_exp_dd";
our $EC_ID_EXP_YY = "ec_id_exp_yy";
our $EC_ID_NUMBER = "ec_id_number";
our $EC_ID_STATE = "ec_id_state";
our $EC_ID_TYPE = "ec_id_type";
our $EC_LAST_NAME = "ec_last_name";
our $EC_BUSINESS_NAME = "ec_BUSINESS_NAME";
our $EC_LICENSE_NUMBER = "ec_LICENSE_NUMBER";
our $EC_LICENSE_STATE = "ec_LICENSE_STATE";
our $EC_MERCHANT_REF = "ec_MERCHANT_REF";
our $EC_NBDS_CODE = "ec_NBDS_CODE";
our $EC_OTHER_NAME = "ec_other_name";
our $EC_PAYEE = "ec_payee";
our $EC_PAYMENT_TYPE = "ec_payment_type";
our $EC_RT = "ec_rt";
our $EC_SERIAL_NUMBER = "ec_serial_number";
our $EC_STATE = "ec_state";
our $EC_TRANSACTION_DT = "ec_transaction_dt";
our $EC_ZIP = "ec_zip";
our $GRAND_TOTAL = "grand_total";
our $MERCHANT_TRACE_NBR = "merchant_trace_nbr";
our $ORDER_NUMBER = "order_number";
our $ORIGINAL_AMOUNT = "original_amount";
our $ORIGINAL_TRANDATE_MM = "original_trandate_mm";
our $ORIGINAL_TRANDATE_DD = "original_trandate_dd";
our $ORIGINAL_TRANDATE_YYYY = "original_trandate_yyyy";
our $ORIGINAL_REFERENCE = "original_reference";
our $PRODUCT_DESCRIPTION = "product_description";
our $PURCHASE_ORDER_NUMBER = "purchase_order_number";
our $SALES_TAX = "sales_tax";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

