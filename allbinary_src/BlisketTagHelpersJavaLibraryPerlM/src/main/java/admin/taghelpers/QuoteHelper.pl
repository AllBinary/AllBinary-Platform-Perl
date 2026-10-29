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

package admin::taghelpers::QuoteHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::BasicTable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abeClientInformation} = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
    $self->{weblisketSession} = undef;
    $self->{storeFrontInterface} = undef;
    $self->{portion} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $storeName = $hashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        if (defined($storeName)) {
            $self->{storeFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($storeName);
        } else {
            $self->{storeFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFront'->new();
        }
        $self->{weblisketSession} = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($hashMap, $pageContext);
        $self->{portion} = 'org::allbinary::business::installer::Portion'->new($hashMap);
    return $self;
}


# throws Exception
sub emailUser {
    my ($self, $quoteRequest) = @_;
        my $user = 'org::allbinary::data::tables::user::UserEntityFactory'->getInstance()->getUser($quoteRequest->getUserName());
        my $userEmailSubject = "Quote Request Receipt";
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("This is just a verification email. ");
        $stringBuffer->append("We usually respond to quote request within 24 hours.");
        $stringBuffer->append("\n\nThank You For Your Business.");
        my $userEmailTextBody = $stringBuffer->toString();
        my $basicEmailInfo = 'org::allbinary::logic::communication::smtp::info::StoreEmailInfo'->new($self->{storeFrontInterface}, $userEmailSubject, $userEmailTextBody);
        my $emailInfo = 'org::allbinary::logic::communication::smtp::info::EmailInfo'->new($basicEmailInfo);
        my $userEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::factory::UserEmailEventHandlerSingletons'->getInstance()->getInstance($self->{abeClientInformation}, $org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::QUOTEREQUEST, $user);
        $userEmailEventHandler->receiveEmailInfo($org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::QUOTEREQUEST, $emailInfo);
}


# throws Exception
sub emailAdmins {
    my ($self, $quoteRequest) = @_;
        my $adminEmailSubject = "Quote Request";
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("\nUserName: ");
        $stringBuffer->append($quoteRequest->getUserName());
        $stringBuffer->append("\nProject Info: \n");
        $stringBuffer->append($quoteRequest->getProjectInfo());
        $stringBuffer->append("\nUser Comments: \n");
        $stringBuffer->append($quoteRequest->getUserComments());
        $stringBuffer->append("\nBudget: \n");
        $stringBuffer->append($quoteRequest->getBudget());
        $stringBuffer->append("\nTime Frame: \n");
        $stringBuffer->append($quoteRequest->getTimeFrame());
        $stringBuffer->append("\nComments: \n");
        $stringBuffer->append($quoteRequest->getComments());
        my $adminEmailTextBody = $stringBuffer->toString();
        my $basicEmailInfo = 'org::allbinary::logic::communication::smtp::info::StoreEmailInfo'->new($self->{storeFrontInterface}, $adminEmailSubject, $adminEmailTextBody);
        my $emailInfo = 'org::allbinary::logic::communication::smtp::info::EmailInfo'->new($basicEmailInfo);
        my $storeAdminUserEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::factory::AdminUserEmailEventHandlerSingletons'->getInstance()->getInstance($self->{abeClientInformation}, $org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::QUOTEREQUEST);
        my $adminUserEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::factory::StoreAdminUserEmailEventHandlerSingletons'->getInstance()->getInstance($org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::QUOTEREQUEST, $self->{abeClientInformation}, $self->{storeFrontInterface});
        $storeAdminUserEmailEventHandler->receiveEmailInfo($org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::QUOTEREQUEST, $emailInfo);
        $adminUserEmailEventHandler->receiveEmailInfo($org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::QUOTEREQUEST, $emailInfo);
}


# throws Exception
sub email {
    my ($self) = @_;
        try {
            my $quoteRequestEntity = 'org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityFactory'->getInstance()->getQuoteRequestEntityInstance();
            my $userName = $self->{weblisketSession}->getUserName();
            my $vector = $quoteRequestEntity->getIds($userName);
            my $id = 0;
            my $size = $vector->size();
            for (my $index = 0; $index < $size; $index++) {
                my $nextId = int(($vector->get($index)));
                if ($id < $nextId) {
                    $id = $nextId;
                }
            }
            my $quoteRequest = $quoteRequestEntity->get($userName, $id);
            if (defined($quoteRequest)) {
                $self->emailUser($quoteRequest);
                $self->emailAdmins($quoteRequest);
                return "Thank You For Your Business.<p/>";
            } else {
                die ("No Quote Request");
            }
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "email", $e);
            }
            return "Thank You For Your Business.<p>";
        }
}


sub drop {
    my ($self) = @_;
        try {
            my $success = 'org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityFactory'->getInstance()->getQuoteRequestEntityInstance()->dropTable();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, $self->{commonStrings}->{DROP});
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to drop QuoteRequest table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{DROP}, $e);
            }
            return $error;
        }
}


sub create {
    my ($self) = @_;
        try {
            my $success = 'org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityFactory'->getInstance()->getQuoteRequestEntityInstance()->createTable();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "create()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to create new QuoteRequest table";
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
            my $result = 'org::allbinary::logic::communication::sql::AbSqlTableUtil'->getInstance()->restoreTable('org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityFactory'->getInstance()->getQuoteRequestEntityInstance(), $self->{portion});
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
            my $success = "Restore Successful";
            my $result = 'org::allbinary::logic::communication::sql::AbSqlTableUtil'->getInstance()->backupTable('org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityFactory'->getInstance()->getQuoteRequestEntityInstance());
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

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFront;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::installer::Portion;
use org::allbinary::business::user::UserInterface;
use org::allbinary::business::user::quoterequest::QuoteRequest;
use org::allbinary::data::tables::user::UserEntityFactory;
use org::allbinary::data::tables::user::quoterequest::QuoteRequestEntity;
use org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityFactory;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::event::UserEmailEventNameData;
use org::allbinary::logic::communication::smtp::event::handler::UserEmailEventHandler;
use org::allbinary::logic::communication::smtp::event::handler::factory::AdminUserEmailEventHandlerSingletons;
use org::allbinary::logic::communication::smtp::event::handler::factory::StoreAdminUserEmailEventHandlerSingletons;
use org::allbinary::logic::communication::smtp::event::handler::factory::UserEmailEventHandlerSingletons;
use org::allbinary::logic::communication::smtp::info::BasicEmailInfo;
use org::allbinary::logic::communication::smtp::info::EmailInfo;
use org::allbinary::logic::communication::smtp::info::StoreEmailInfo;
use org::allbinary::logic::communication::sql::AbSqlTableUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use admin::taghelpers::BasicTable;

1;

