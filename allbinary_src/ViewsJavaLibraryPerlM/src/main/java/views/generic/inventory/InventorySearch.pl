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

package views::generic::inventory::InventorySearch;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::admin::inventory::listings::InventoryViewSearchInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
    $self->{searchRequest} = undef;
}


sub new {
    my ($class, $searchRequest) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        # super(...) made $self above
        $self->{searchRequest} = $searchRequest;
    return $self;
}


# throws Exception
sub searchSingleStaticPage {
    my ($self) = @_;
        try {
            my $storeFront = $self->{searchRequest}->getStoreFront();
            my $searchParams = $self->{searchRequest}->getParams();
            my $columnValueHashMap = $searchParams->get();
            my $file = 'org::allbinary::data::tables::staticpages::StaticPagesEntity'->new()->getFile($storeFront->getName(), 'org::allbinary::logic::string::regex::replace::Replace'->new("-", 'org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->all($columnValueHashMap->get($self->{basicItemData}->{KEYWORDS})));
            if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($file)) {
                return undef;
            } else {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append($storeFront->getCurrentHostName());
                $stringBuffer->append($storeFront->getCurrentHostNamePath());
                $stringBuffer->append($storeFront->getStaticPath());
                $stringBuffer->append($file);
                $stringBuffer->append($self->{searchRequest}->getParams()->getEndPage());
                $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP});
                $stringBuffer->append('org::allbinary::logic::io::InputOutputTypeData'->getInstance()->{DEFAULT});
                my $filePath = 'org::allbinary::logic::string::regex::replace::Replace'->new('org::allbinary::string::CommonSeps'->getInstance()->{SPACE}, "%20")->all($stringBuffer->toString());
                return $filePath;
            }
        } catch ($e) {
            if ($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRODUCTSEARCHLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "searchSingleStaticPage", $e);
            }
            die ("Failed retrieve Single Product Page Static");
        }
}


# throws Exception
sub searchSingleDynamicPage {
    my ($self) = @_;
        try {
            my $str = $self->search();
            return $str->[int($self->{searchRequest}->getParams()->getStartPageInt())];
        } catch ($e) {
            if ($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRODUCTSEARCHLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "searchSingleDynamicPage", $e);
            }
            die ("Failed retrieve Single Product Page Dynamically");
        }
}


# throws Exception
sub search {
    my ($self) = @_;
        my $abeClientInformation = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
        my $inventorySearchUtil = 'views::generic::inventory::InventorySearchUtil'->getInstance();
        my $vector = $inventorySearchUtil->getBasicItemIdColumn($self->{searchRequest});
        return $inventorySearchUtil->search($abeClientInformation, $self->{searchRequest}, $vector);
}


# throws Exception
sub getProduct {
    my ($self, $product) = @_;
        my $abeClientInformation = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
        return 'views::generic::inventory::InventorySearchProductUtil'->getInstance()->getProduct($abeClientInformation, $self->{searchRequest}, $product);
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::data::tables::staticpages::StaticPagesEntity;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::search::SearchParams;
use org::allbinary::logic::control::search::SearchRequest;
use org::allbinary::logic::io::InputOutputTypeData;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::string::regex::replace::Replace;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use views::admin::inventory::listings::InventoryViewSearchInterface;
use views::generic::inventory::InventorySearchUtil;
use views::generic::inventory::InventorySearchProductUtil;

1;

