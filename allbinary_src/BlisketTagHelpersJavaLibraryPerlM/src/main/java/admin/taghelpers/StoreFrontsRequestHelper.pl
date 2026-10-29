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

package admin::taghelpers::StoreFrontsRequestHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::ModifyTable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abeClientInformation} = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
    $self->{pageContext} = undef;
    $self->{request} = undef;
    $self->{weblisketSession} = undef;
    $self->{storeName} = undef;
    $self->{modifyingStoreFrontInterface} = undef;
    $self->{portion} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{pageContext} = $pageContext;
        $self->{request} = $pageContext->getRequest();
        $self->{weblisketSession} = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($hashMap, $pageContext);
        $self->{portion} = 'org::allbinary::business::installer::Portion'->new($hashMap);
        $self->getFormData();
    return $self;
}


# throws Exception
sub getFormData {
    my ($self) = @_;
        $self->{storeName} = $self->{weblisketSession}->getStoreName();
        $self->{modifyingStoreFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFront'->new($self->{request});
}


sub update {
    my ($self) = @_;
        try {
            my $success = "Updated Successfully";
            my $hashMapData = $self->{modifyingStoreFrontInterface}->toHashMap();
            'org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory'->getInstance()->getStoreFrontsEntityInstance()->update($hashMapData);
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "update()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to update storefronts table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "update()", $e);
            }
            return $error;
        }
}


# throws Exception
sub sendStoreCreatedEmails {
    my ($self) = @_;
        my $storeManagerEmailSubject = "Store Manager Nofification For Store: " . $self->{modifyingStoreFrontInterface}->getName();
        my $adminEmailSubject = "Admin Notification For Store: " . $self->{modifyingStoreFrontInterface}->getName();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Store Created: ");
        $stringBuffer->append($self->{modifyingStoreFrontInterface}->getName());
        $stringBuffer->append("\n\n");
        $stringBuffer->append("Click here for the Admin Interface:\n");
        $stringBuffer->append($self->{modifyingStoreFrontInterface}->getCurrentHomeHostName());
        $stringBuffer->append("/admin/login.jsp\n\n");
        $stringBuffer->append("Goto Your Store:\n");
        $stringBuffer->append($self->{modifyingStoreFrontInterface}->getCurrentHomeHostName());
        $stringBuffer->append($self->{modifyingStoreFrontInterface}->getName());
        $stringBuffer->append("/index.jsp");
        $stringBuffer->append("\n\n");
        $stringBuffer->append("UserName: ");
        $stringBuffer->append($self->{weblisketSession}->getUserName());
        my $adminEmailTextBody = $stringBuffer->toString();
        my $adminBasicEmailInfo = 'org::allbinary::logic::communication::smtp::info::AdminEmailInfo'->new($adminEmailSubject, $adminEmailTextBody);
        my $storeAdminBasicEmailInfo = 'org::allbinary::logic::communication::smtp::info::StoreEmailInfo'->new($self->{modifyingStoreFrontInterface}, $storeManagerEmailSubject, $adminEmailTextBody);
        my $storeAdminEmailInfo = 'org::allbinary::logic::communication::smtp::info::EmailInfo'->new($storeAdminBasicEmailInfo);
        my $adminEmailInfo = 'org::allbinary::logic::communication::smtp::info::EmailInfo'->new($adminBasicEmailInfo);
        my $adminUserEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::factory::AdminUserEmailEventHandlerSingletons'->getInstance()->getInstance($self->{abeClientInformation}, $org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::STORECREATED);
        my $storeAdminUserEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::factory::StoreAdminUserEmailEventHandlerSingletons'->getInstance()->getInstance($org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::STORECREATED, $self->{abeClientInformation}, $self->{modifyingStoreFrontInterface});
        $storeAdminUserEmailEventHandler->receiveEmailInfo($org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::STORECREATED, $storeAdminEmailInfo);
        $adminUserEmailEventHandler->receiveEmailInfo($org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::STORECREATED, $adminEmailInfo);
}


sub install {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Intall StoreFront Successfully: ");
            $stringBuffer->appendint(int(int($self->{portion}->getCurrent())));
            $stringBuffer->append(" of ");
            $stringBuffer->appendint(int(int($self->{portion}->getTotal())));
            my $success = $stringBuffer->toString();
            $self->{modifyingStoreFrontInterface}->install(int($self->{portion}->getCurrent()), int($self->{portion}->getTotal()));
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "install()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to Install storefront";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "install()", $e);
            }
            return $error;
        }
}


sub insert {
    my ($self) = @_;
        try {
            my $success = "Added Successfully";
            my $values = $self->{modifyingStoreFrontInterface}->toVector();
            'org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory'->getInstance()->getStoreFrontsEntityInstance()->insert($values);
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "insert()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to add storefront";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "insert()", $e);
            }
            return $error;
        }
}


sub delete {
    my ($self) = @_;
        try {
            my $success = "Delete Successfully";
            'org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory'->getInstance()->getStoreFrontsEntityInstance()->delete($self->{storeName});
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "delete()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to delete storefronts table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "delete()", $e);
            }
            return $error;
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFront;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::installer::Portion;
use org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::event::UserEmailEventNameData;
use org::allbinary::logic::communication::smtp::event::handler::UserEmailEventHandler;
use org::allbinary::logic::communication::smtp::event::handler::factory::AdminUserEmailEventHandlerSingletons;
use org::allbinary::logic::communication::smtp::event::handler::factory::StoreAdminUserEmailEventHandlerSingletons;
use org::allbinary::logic::communication::smtp::info::AdminEmailInfo;
use org::allbinary::logic::communication::smtp::info::BasicEmailInfo;
use org::allbinary::logic::communication::smtp::info::EmailInfo;
use org::allbinary::logic::communication::smtp::info::StoreEmailInfo;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use admin::taghelpers::ModifyTable;

1;

