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

package admin::taghelpers::StaticPagesRequestHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::context::AbContext','admin::taghelpers::TagHelperInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abeClientInformation} = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
    $self->{request} = undef;
    $self->{storeName} = undef;
    $self->{searchParams} = undef;
    $self->{xslFile} = undef;
}


sub new {
    my ($class, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new($propertiesHashMap, $pageContext);
    $self->_init_fields();
        # super(...) made $self above
        $self->{request} = $pageContext->getRequest();
        $self->{xslFile} = $propertiesHashMap->get('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{TEMPLATEFILENAME});
        $self->getFormData();
    return $self;
}


sub getFormData {
    my ($self) = @_;
        $self->{storeName} = $self->{request}->getParameter('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        $self->{searchParams} = 'org::allbinary::logic::control::search::SearchParams'->new($self->{request});
}


# throws Exception
sub email {
    my ($self) = @_;
        try {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
                $self->{logUtil}->putF("Generated Static Pages Notification Email", $self, "email");
            }
            my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->{storeName});
            my $adminEmailSubject = "Generated Static Pages Email Notification";
            my $adminEmailTextBody = "Generated static pages for store: " . $self->{storeName};
            my $adminBasicEmailInfo = 'org::allbinary::logic::communication::smtp::info::AdminEmailInfo'->new($adminEmailSubject, $adminEmailTextBody);
            my $storeAdminBasicEmailInfo = 'org::allbinary::logic::communication::smtp::info::StoreEmailInfo'->new($storeFrontInterface, $adminEmailSubject, $adminEmailTextBody);
            my $storeAdminEmailInfo = 'org::allbinary::logic::communication::smtp::info::EmailInfo'->new($storeAdminBasicEmailInfo);
            my $adminEmailInfo = 'org::allbinary::logic::communication::smtp::info::EmailInfo'->new($adminBasicEmailInfo);
            my $adminUserEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::factory::AdminUserEmailEventHandlerSingletons'->getInstance()->getInstance($self->{abeClientInformation}, $org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::STOREGENERATINGSTATICPAGES);
            my $storeAdminUserEmailEventHandler = 'org::allbinary::logic::communication::smtp::event::handler::factory::StoreAdminUserEmailEventHandlerSingletons'->getInstance()->getInstance($org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::STOREGENERATINGSTATICPAGES, $self->{abeClientInformation}, $storeFrontInterface);
            $storeAdminUserEmailEventHandler->receiveEmailInfo($org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::STOREGENERATINGSTATICPAGES, $storeAdminEmailInfo);
            $adminUserEmailEventHandler->receiveEmailInfo($org::allbinary::logic::communication::smtp::event::UserEmailEventNameData::STOREGENERATINGSTATICPAGES, $adminEmailInfo);
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "email", $e);
            }
        }
}


sub generateStaticPages {
    my ($self) = @_;
        try {
            my $contentType = 'org::allbinary::logic::communication::http::AcceptableResponseGenerator'->getInstance()->get($self->{request});
            my $searchRequest = 'org::allbinary::logic::control::search::SearchRequest'->new(undef, $self->{searchParams}, $self->{xslFile}, $contentType, $self->getPropertiesHashMap(), $self->getPageContext());
            my $success = 'views::admin::inventory::listings::ProductListingFactory'->getInstance($searchRequest)->generateAll($self->{storeName});
            $self->email();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "generateStaticPages()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to generate staticpages table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "generateStaticPages()", $e);
            }
            return $error;
        }
}


sub makePublic {
    my ($self) = @_;
        try {
            my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->{storeName});
            my $fromAbPath = 'org::allbinary::logic::io::path::AbPath'->new($storeFrontInterface->getTestHtmlPath() + $storeFrontInterface->getStaticPath(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            my $toAbPath = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getWebappPath() . $storeFrontInterface->getName() . 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR} . $storeFrontInterface->getStaticPath(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            'org::allbinary::logic::io::file::FileUtil'->getInstance()->copy($fromAbPath, $toAbPath);
            my $success = "Made Public";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "makePublic()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to makePublic";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "makePublic()", $e);
            }
            return $error;
        }
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::AbContext;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::http::AcceptableResponseGenerator;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::event::UserEmailEventNameData;
use org::allbinary::logic::communication::smtp::event::handler::UserEmailEventHandler;
use org::allbinary::logic::communication::smtp::event::handler::factory::AdminUserEmailEventHandlerSingletons;
use org::allbinary::logic::communication::smtp::event::handler::factory::StoreAdminUserEmailEventHandlerSingletons;
use org::allbinary::logic::communication::smtp::info::AdminEmailInfo;
use org::allbinary::logic::communication::smtp::info::BasicEmailInfo;
use org::allbinary::logic::communication::smtp::info::EmailInfo;
use org::allbinary::logic::communication::smtp::info::StoreEmailInfo;
use org::allbinary::logic::control::search::SearchParams;
use org::allbinary::logic::control::search::SearchRequest;
use org::allbinary::logic::io::file::FileUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use views::admin::inventory::listings::ProductListingFactory;
use admin::taghelpers::TagHelperInterface;

1;

