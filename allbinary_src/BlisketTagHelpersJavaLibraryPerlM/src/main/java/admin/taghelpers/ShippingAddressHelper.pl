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

package admin::taghelpers::ShippingAddressHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::BasicTable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{weblisketSession} = undef;
    $self->{request} = undef;
    $self->{userName} = undef;
    $self->{streetAddress} = undef;
    $self->{portion} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{request} = $pageContext->getRequest();
        $self->{weblisketSession} = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($hashMap, $pageContext);
        $self->{portion} = 'org::allbinary::business::installer::Portion'->new($hashMap);
        $self->getAddressForm();
    return $self;
}


sub getAddressForm {
    my ($self) = @_;
        $self->{userName} = $self->{request}->getParameter($org::allbinary::business::user::UserData::USERNAME);
        if (!defined($self->{userName})) {
            $self->{userName} = $self->{request}->getParameter($org::allbinary::logic::communication::http::request::session::WeblisketSessionData::REMOVABLEUSERNAME);
        }
        $self->{streetAddress} = 'org::allbinary::business::user::address::StreetAddress'->new($self->{request});
}


sub drop {
    my ($self) = @_;
        try {
            my $success = 'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity'->new($self->{stringUtil}->{EMPTY_STRING})->drop();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, $self->{commonStrings}->{DROP});
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to drop Admin table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{DROP}, $e);
            }
            return $error;
        }
}


sub create {
    my ($self) = @_;
        try {
            my $success = 'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity'->new($self->{stringUtil}->{EMPTY_STRING})->createTable();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "create()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to create user table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "create()", $e);
            }
            return $error;
        }
}


sub restore {
    my ($self) = @_;
        try {
            my $success = "Restore Successful";
            my $result = 'org::allbinary::logic::communication::sql::AbSqlTableUtil'->getInstance()->restoreTable('org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}), $self->{portion});
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "restore()");
            }
            return $result;
        } catch ($e) {
            my $error = "Failed to restore backup";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "restore()", $e);
            }
            return $error;
        }
}


sub backup {
    my ($self) = @_;
        try {
            my $success = "Backup Successful";
            my $result = 'org::allbinary::logic::communication::sql::AbSqlTableUtil'->getInstance()->backupTable('org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}));
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "backup()");
            }
            return $result;
        } catch ($e) {
            my $error = "Failed to make backup";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "backup()", $e);
            }
            return $error;
        }
}


sub insert {
    my ($self) = @_;
        try {
            my $success = "Successfully Added Shipping Address";
            'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntityFactory'->getInstance()->getInstance($self->{weblisketSession}->getUserName())->add($self->{streetAddress});
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "insert");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to add Shipping streetAddress";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "insert", $e);
            }
            return $error;
        }
}


sub update {
    my ($self) = @_;
        try {
            my $success = "Successfully Updated Shipping Address";
            'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntityFactory'->getInstance()->getInstance($self->{weblisketSession}->getUserName())->update($self->{streetAddress});
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF("Successfull update of a Users Shipping Address table", $self, "update()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed update of a Users Shipping Address Table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "update", $e);
            }
            return $error;
        }
}


sub setToBillingAddress {
    my ($self) = @_;
        try {
            my $streetAddress = 'org::allbinary::data::tables::user::address::billing::BillingAddressesEntityFactory'->getInstance()->getInstance($self->{weblisketSession}->getUserName())->getDefault();
            if (defined($streetAddress)) {
                'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntityFactory'->getInstance()->getInstance($self->{weblisketSession}->getUserName())->add($streetAddress);
            } else {
                return "No Billing Address";
            }
            return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        } catch ($e) {
            my $error = "Failed Setting Shipping address to Billing Address";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "setToBillingAddress()", $e);
            }
            return $error;
        }
}


sub delete {
    my ($self) = @_;
        try {
            my $success = "Successfully Removed Shipping Address";
            'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntityFactory'->getInstance()->getInstance($self->{weblisketSession}->getUserName())->remove($self->{streetAddress}->getId());
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "remove()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to remove Shipping Address";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "remove()", $e);
            }
            return $error;
        }
}


sub set {
    my ($self) = @_;
        try {
            my $success = "Successfully Set Shipping Address";
            'org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntityFactory'->getInstance()->getInstance($self->{weblisketSession}->getUserName())->setDefault($self->{streetAddress}->getId());
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "set()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to set Shipping Address";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "set()", $e);
            }
            return $error;
        }
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::installer::Portion;
use org::allbinary::business::user::UserData;
use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::data::tables::user::address::billing::BillingAddressesEntityFactory;
use org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntity;
use org::allbinary::data::tables::user::address::shipping::ShippingAddressesEntityFactory;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlTableUtil;
use org::allbinary::logic::string::StringUtil;
use admin::taghelpers::BasicTable;

1;

