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

package org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{TRXTYPE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("TRXTYPE");
    $self->{TENDER} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("TENDER");
    $self->{ACCT} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("ACCT");
    $self->{EXPDATE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("EXPDATE");
    $self->{AMT} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("AMT");
    $self->{AUTHCODE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("AUTHCODE");
    $self->{MICR} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("MICR");
    $self->{CHECKNUM} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("CHECKNUM");
    $self->{NAME} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("NAME");
    $self->{STREET} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("STREET");
    $self->{CITY} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("CITY");
    $self->{STATE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("STATE");
    $self->{ZIP} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("ZIP");
    $self->{DL} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("DL");
    $self->{EMAIL} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("EMAIL");
    $self->{COMMENT1} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("COMMENT1");
    $self->{COMMENT2} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("COMMENT2");
    $self->{ORIGID} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("ORIGID");
    $self->{PONUM} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("PONUM");
    $self->{DESC} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("PaymentTransactionDESC");
    $self->{DESC1TO4} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("DESC1TO4");
    $self->{INVNUM} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("INVNUM");
    $self->{SHIPTOZIP} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("SHIPTOZIP");
    $self->{SWIPE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("SWIPE");
    $self->{TAXAMT} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("TAXAMT");
    $self->{COMMCARD} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("COMMCARD");
    $self->{DUTYAMT} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("DUTYAMT");
    $self->{FRIEGHTAMT} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("FRIEGHTAMT");
    $self->{ORDERDATE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("ORDERDATE");
    $self->{TAXEXEMPT} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("TAXEXEMPT");
    $self->{COUNTRYCODE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("COUNTRYCODE");
    $self->{CUSTCODE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("CUSTCODE");
    $self->{CVV2} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("CVV2");
    $self->{ABA} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("ABA");
    $self->{ACCTTYPE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("ACCTTYPE");
    $self->{DISCOUNT} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("DISCOUNT");
    $self->{FIRSTNAME} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("FIRSTNAME");
    $self->{LASTNAME} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("LASNAME");
    $self->{SHIPFROMZIP} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("SHIPFROMZIP");
    $self->{PRENOTE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("PRENOTE");
    $self->{CHKTYPE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("CHKTYPE");
    $self->{DOB} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("DOB");
    $self->{PHONENUM} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("PHONENUM");
    $self->{SS} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("SS");
    $self->{COMPANYNAME} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("COMPANYNAME");
    $self->{COUNTRY} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("COUNTRY");
    $self->{FREIGHTAMT} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("FREIGHTAMT");
    $self->{SHIPTOCITY} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("SHIPTOCITY");
    $self->{SHIPTOFIRSTNAME} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("SHIPTOFIRSTNAME");
    $self->{SHIPTOLASTNAME} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("SHIPTOLASTNAME");
    $self->{SHIPTOSTATE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("SHIPTOSTATE");
    $self->{SHIPTOSTREET} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("SHIPTOSTREET");
    $self->{SPECIAL1} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("SPECIAL1");
    $self->{SPECIAL2} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("SPECIAL2");
    $self->{SPECIAL3} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("SPECIAL3");
    $self->{PARTNER} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("PARTNER");
    $self->{VENDOR} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("VENDOR");
    $self->{USER} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("USER");
    $self->{PWD} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("PWD");
    $self->{CHKNUM} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("CHKNUM");
    $self->{AVSADDR} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("AVSADDR");
    $self->{AVSZIP} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("AVSZIP");
    $self->{PNREF} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("PNREF");
    $self->{RESPMSG} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("RESPMSG");
    $self->{RESULT} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("RESULT");
    $self->{ORIGRESULT} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("ORIGRESULT");
    $self->{STATUS} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("STATUS");
    $self->{FRAUDCODE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("FRAUDCODE");
    $self->{FRAUDMSG} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("FRAUDMSG");
    $self->{ERRCODE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("ERRCODE");
    $self->{SCORE} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("SCORE");
    $self->{REASON1} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("REASON1");
    $self->{REASON2} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("REASON2");
    $self->{REASON3} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("REASON3");
    $self->{EXCEPTION1} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("EXCEPTION1");
    $self->{EXCEPTION2} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("EXCEPTION2");
    $self->{EXCEPTION3} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("EXCEPTION3");
    $self->{EXCEPTION4} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("EXCEPTION4");
    $self->{EXCEPTION5} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("EXCEPTION5");
    $self->{EXCEPTION6} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("EXCEPTION6");
    $self->{EXCEPTION7} = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys'->new("EXCEPTION7");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeysFactory::instance;
}

use org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionKeys;

1;

