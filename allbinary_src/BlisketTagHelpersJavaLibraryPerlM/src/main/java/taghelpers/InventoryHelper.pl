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

package taghelpers::InventoryHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelper';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
    $self->{weblisketSession} = undef;
    $self->{response} = undef;
    $self->{request} = undef;
    $self->{streetAddress} = undef;
    $self->{id} = undef;
    $self->{searchRequest} = undef;
}


sub new {
    my ($class, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{response} = $pageContext->getResponse();
        $self->{request} = $pageContext->getRequest();
        my $storeName = $propertiesHashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        my $xslFile = $propertiesHashMap->get('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{TEMPLATEFILENAME});
        if (defined($storeName)) {
            my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($storeName);
            my $contentType = 'org::allbinary::logic::communication::http::AcceptableResponseGenerator'->getInstance()->get($self->{request});
            my $searchParams = 'org::allbinary::logic::control::search::SearchParams'->new($self->{request});
            $self->{searchRequest} = 'org::allbinary::logic::control::search::SearchRequest'->new($storeFrontInterface, $searchParams, $xslFile, $contentType, $propertiesHashMap, $pageContext);
        }
        $self->getFormData();
    return $self;
}


sub getFormData {
    my ($self) = @_;
        $self->{id} = $self->{request}->getParameter($self->{basicItemData}->{ID});
}


sub viewSummary {
    my ($self) = @_;
        try {
            my $inventoryViewSearchInterface = 'views::admin::inventory::listings::InventoryViewFactory'->getInstance($self->{searchRequest});
            my $result = $inventoryViewSearchInterface->getProduct($self->{id});
            if ($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF("Successfull Inventory View Summary", $self, "viewSummary()");
            }
            return $result;
        } catch ($e) {
            my $error = "Failed to View Summary";
            if ($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "viewSummary()", $e);
            }
            return $error . "<br>" . "Exception: " . $e . "<br>";
        }
}


sub search {
    my ($self) = @_;
        try {
            my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
            my $keywords = $self->{searchRequest}->getParams()->get()->get($self->{basicItemData}->{KEYWORDS});
            if (!defined($keywords) || ($keywords cmp $stringUtil->{EMPTY_STRING}) == 0) {
                return "Please enter a keyword in the search field above the Search button.";
            }
            my $inventoryViewSearchInterface = 'views::admin::inventory::listings::InventoryViewFactory'->getInstance($self->{searchRequest});
            my $result = $inventoryViewSearchInterface->searchSingleDynamicPage();
            if ($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF("Successful Inventory Dynamic Search", $self, "searchSingleDynamicPage()");
            }
            return $result;
        } catch ($e) {
            my $error = "Failed to search Inventory by keyword";
            if ($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "searchSingleDynamicPage()", $e);
            }
            return $error . "<br>" . "Exception: " . $e . "<br>";
        }
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::http::HttpServletResponse;
# use javax::servlet::jsp::PageContext;
use admin::taghelpers::TagHelper;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::logic::communication::http::AcceptableResponseGenerator;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::search::SearchParams;
use org::allbinary::logic::control::search::SearchRequest;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use views::admin::inventory::listings::InventoryViewFactory;
use views::admin::inventory::listings::InventoryViewSearchInterface;

1;

