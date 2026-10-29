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

#Warning you must have sql root access
package org::allbinary::business::installer::InitDbCrypted;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbDatabaseManagement';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{userDbInitInfo} = undef;
    $self->{inventoryDbInitInfo} = undef;
    $self->{historyDbInitInfo} = undef;
    $self->{staticpagesDbInitInfo} = undef;
    $self->{logDbInitInfo} = undef;
    $self->{SQL_FILE} = "initWeblisket.sql";
}


sub new {
    my ($class, $databaseConnectionInfoInterface) = @_;
    my $self = $class->SUPER::new($databaseConnectionInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub addUsers {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{METHOD_ADD_USERS});
            $self->{userDbInitInfo} = 'org::allbinary::business::init::db::UserDbInitInfo'->new();
            $self->{inventoryDbInitInfo} = 'org::allbinary::business::init::db::InventoryDbInitInfo'->new();
            $self->{historyDbInitInfo} = 'org::allbinary::business::init::db::HistoryDbInitInfo'->new();
            $self->{staticpagesDbInitInfo} = 'org::allbinary::business::init::db::StaticPagesDbInitInfo'->new();
            $self->{logDbInitInfo} = 'org::allbinary::business::init::db::LogDbInitInfo'->new();
            my $CUSTOMERDB = $self->{userDbInitInfo}->getName();
            my $CUSTOMERDBUSER = $self->{userDbInitInfo}->getUserName();
            my $CUSTOMERDBPASSWORD = $self->{userDbInitInfo}->getPassword();
            if (!$self->addDbUser($CUSTOMERDB, $CUSTOMERDBUSER, $CUSTOMERDBPASSWORD)) {
                $self->{logUtil}->putF($self->{UNABLE_TO_CREATE_USER} . $CUSTOMERDBUSER, $self, $self->{METHOD_ADD_USERS});
                return 0;
            }
            my $INVENTORYDB = $self->{inventoryDbInitInfo}->getName();
            my $INVENTORYDBUSER = $self->{inventoryDbInitInfo}->getUserName();
            my $INVENTORYDBPASSWORD = $self->{inventoryDbInitInfo}->getPassword();
            if (!$self->addDbUser($INVENTORYDB, $INVENTORYDBUSER, $INVENTORYDBPASSWORD)) {
                $self->{logUtil}->putF($self->{UNABLE_TO_CREATE_USER} . $INVENTORYDBUSER, $self, $self->{METHOD_ADD_USERS});
                return 0;
            }
            my $HISTORYDB = $self->{historyDbInitInfo}->getName();
            my $HISTORYDBUSER = $self->{historyDbInitInfo}->getUserName();
            my $HISTORYDBPASSWORD = $self->{historyDbInitInfo}->getPassword();
            if (!$self->addDbUser($HISTORYDB, $HISTORYDBUSER, $HISTORYDBPASSWORD)) {
                $self->{logUtil}->putF($self->{UNABLE_TO_CREATE_USER} . $HISTORYDBUSER, $self, $self->{METHOD_ADD_USERS});
                return 0;
            }
            my $STATICPAGESDB = $self->{staticpagesDbInitInfo}->getName();
            my $STATICPAGESDBUSER = $self->{staticpagesDbInitInfo}->getUserName();
            my $STATICPAGESDBPASSWORD = $self->{staticpagesDbInitInfo}->getPassword();
            if (!$self->addDbUser($STATICPAGESDB, $STATICPAGESDBUSER, $STATICPAGESDBPASSWORD)) {
                $self->{logUtil}->putF($self->{UNABLE_TO_CREATE_USER} . $STATICPAGESDBUSER, $self, $self->{METHOD_ADD_USERS});
                return 0;
            }
            my $LOGDB = $self->{logDbInitInfo}->getName();
            my $LOGDBUSER = $self->{logDbInitInfo}->getUserName();
            my $LOGDBPASSWORD = $self->{logDbInitInfo}->getPassword();
            if (!$self->addDbUser($LOGDB, $LOGDBUSER, $LOGDBPASSWORD)) {
                $self->{logUtil}->putF($self->{UNABLE_TO_CREATE_USER} . $LOGDBUSER, $self, $self->{METHOD_ADD_USERS});
                return 0;
            }
            $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, $self->{METHOD_ADD_USERS});
            return 1;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{METHOD_ADD_USERS}, $e);
            return 1;
        }
}


sub addDatabases {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{METHOD_ADD_DATABASES});
            $self->{userDbInitInfo} = 'org::allbinary::business::init::db::UserDbInitInfo'->new();
            $self->{inventoryDbInitInfo} = 'org::allbinary::business::init::db::InventoryDbInitInfo'->new();
            $self->{historyDbInitInfo} = 'org::allbinary::business::init::db::HistoryDbInitInfo'->new();
            $self->{staticpagesDbInitInfo} = 'org::allbinary::business::init::db::StaticPagesDbInitInfo'->new();
            $self->{logDbInitInfo} = 'org::allbinary::business::init::db::LogDbInitInfo'->new();
            my $CUSTOMERDB = $self->{userDbInitInfo}->getName();
            if (!$self->addDb($CUSTOMERDB)) {
                $self->{logUtil}->putF($self->{UNABLE_TO_CREATE_DATABASE} . $CUSTOMERDB, $self, $self->{METHOD_ADD_DATABASES});
                return 0;
            }
            my $INVENTORYDB = $self->{inventoryDbInitInfo}->getName();
            if (!$self->addDb($INVENTORYDB)) {
                $self->{logUtil}->putF($self->{UNABLE_TO_CREATE_DATABASE} . $INVENTORYDB, $self, $self->{METHOD_ADD_DATABASES});
                return 0;
            }
            my $HISTORYDB = $self->{historyDbInitInfo}->getName();
            if (!$self->addDb($HISTORYDB)) {
                $self->{logUtil}->putF($self->{UNABLE_TO_CREATE_DATABASE} . $HISTORYDB, $self, $self->{METHOD_ADD_DATABASES});
                return 0;
            }
            my $STATICPAGESDB = $self->{staticpagesDbInitInfo}->getName();
            if (!$self->addDb($STATICPAGESDB)) {
                $self->{logUtil}->putF($self->{UNABLE_TO_CREATE_DATABASE} . $STATICPAGESDB, $self, $self->{METHOD_ADD_DATABASES});
                return 0;
            }
            my $LOGDB = $self->{logDbInitInfo}->getName();
            if (!$self->addDb($LOGDB)) {
                $self->{logUtil}->putF($self->{UNABLE_TO_CREATE_DATABASE} . $LOGDB, $self, $self->{METHOD_ADD_DATABASES});
                return 0;
            }
            my $file = 'org::allbinary::logic::io::file::FileFactory'->getInstance()->getInstance($self->{SQL_FILE});
            $file->createNewFile();
            my $idOutData = 'org::allbinary::logic::io::DataOutputStreamFactory'->getInstance()->getInstanceForAbFile($file);
            $idOutData->writeBytes($self->{sqlCommandLog}->toString());
            return 1;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{METHOD_ADD_DATABASES}, $e);
            return 1;
        }
}


sub addTables {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{METHOD_ADD_TABLES});
            $stringBuffer->append('org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->createTable());
            $stringBuffer->append('org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory'->getInstance()->getStoreFrontsEntityInstance()->createTable());
            $stringBuffer->append('org::allbinary::data::tables::user::address::billing::BillingAddressesEntityFactory'->getInstance()->getInstance($self->{stringUtil}->{EMPTY_STRING})->createTable());
            $stringBuffer->append('org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntityFactory'->getInstance()->getInstance($self->{stringUtil}->{EMPTY_STRING})->createTable());
            $stringBuffer->append('org::allbinary::data::tables::user::commerce::money::payment::PaymentEntityFactory'->getInstance()->getPaymentEntityInstance()->createTable());
            $stringBuffer->append('org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityFactory'->getInstance()->getQuoteRequestEntityInstance()->createTable());
            $stringBuffer->append('org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory'->getInstance()->createTable());
            $stringBuffer->append('org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntityFactory'->getInstance()->createTable());
            $stringBuffer->append('org::allbinary::data::tables::user::commerce::money::payment::transaction::TransactionEntityFactory'->getInstance()->getTransactionEntityInstance()->createTable());
            $stringBuffer->append('org::allbinary::data::tables::user::commerce::money::payment::transaction::TransactionResultEntityFactory'->getInstance()->getTransactionResultEntityInstance()->createTable());
            $stringBuffer->append('org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntityFactory'->getInstance()->createTable());
            $stringBuffer->append('org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory'->getInstance()->getInventoryEntityInstance()->createTable());
            $stringBuffer->append('org::allbinary::business::init::InitInfoEntity'->new()->createTable());
            $stringBuffer->append('org::allbinary::data::tables::log::LogTableEntityFactory'->getInstance()->getLogTableEntityInstance()->createTable());
            $stringBuffer->append('org::allbinary::data::tables::staticpages::StaticPagesEntityFactory'->getInstance()->getStaticPagesEntityInstance()->createTable());
            $stringBuffer->append('org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance()->createTable());
            $self->{logUtil}->putF($self->{ADD_TABLES_RESULTS_LABEL} . $stringBuffer->toString(), $self, $self->{METHOD_ADD_TABLES});
            return 1;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{METHOD_ADD_TABLES}, $e);
            return 0;
        }
}

use org::allbinary::business::init::InitInfoEntity;
use org::allbinary::business::init::db::DatabaseConnectionInfoInterface;
use org::allbinary::business::init::db::DbConnectionInfo;
use org::allbinary::business::init::db::HistoryDbInitInfo;
use org::allbinary::business::init::db::InventoryDbInitInfo;
use org::allbinary::business::init::db::LogDbInitInfo;
use org::allbinary::business::init::db::StaticPagesDbInitInfo;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory;
use org::allbinary::data::tables::log::LogTableEntityFactory;
use org::allbinary::data::tables::staticpages::StaticPagesEntityFactory;
use org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder;
use org::allbinary::data::tables::user::UserEntityFactory;
use org::allbinary::data::tables::user::address::billing::BillingAddressesEntityFactory;
use org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntityFactory;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntityFactory;
use org::allbinary::data::tables::user::commerce::money::payment::PaymentEntityFactory;
use org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntityFactory;
use org::allbinary::data::tables::user::commerce::money::payment::transaction::TransactionEntityFactory;
use org::allbinary::data::tables::user::commerce::money::payment::transaction::TransactionResultEntityFactory;
use org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbDatabaseManagement;
use org::allbinary::logic::io::AbDataOutputStream;
use org::allbinary::logic::io::DataOutputStreamFactory;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FileFactory;
use org::allbinary::logic::string::StringMaker;

1;

