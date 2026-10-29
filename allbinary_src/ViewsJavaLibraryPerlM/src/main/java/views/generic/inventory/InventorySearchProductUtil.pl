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

package views::generic::inventory::InventorySearchProductUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'views::generic::inventory::InventorySearchProductUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{ITEM_NOT_FOUND} = "Item Not Found.";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $views::generic::inventory::InventorySearchProductUtil::instance;
}


# throws Exception
sub getProduct {
    my ($self, $abeClientInformation, $searchRequest, $product) = @_;
        try {
            my $inventoryEntityInterface = 'org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory'->getInstance()->getInventoryEntityInstance();
            my $itemInterface = $inventoryEntityInterface->getItem($product);
            if (defined($itemInterface)) {
                my $viewDocumentInterface = 'org::allbinary::logic::visual::transform::data::TransformStoreDocumentFactory'->getInstance($searchRequest);
                $viewDocumentInterface->getBaseNode()->appendChild('org::allbinary::business::user::commerce::inventory::item::BasicItemView'->new($itemInterface, 'org::allbinary::util::BasicArrayListD'->new())->toXmlNode($viewDocumentInterface->getDoc()));
                my $success = 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($viewDocumentInterface->getDoc());
                my $outputStr = 'org::allbinary::logic::visual::transform::StoreTransformer'->new($abeClientInformation, 'org::allbinary::logic::visual::transform::info::TransformInfoHttpSearch'->new($searchRequest))->translate($success);
                return $outputStr;
            } else {
                return $self->{ITEM_NOT_FOUND};
            }
        } catch ($e) {
            if ($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRODUCTSEARCHLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "getProduct", $e);
            }
            die ("Failed to getProduct");
        }
}

use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::commerce::inventory::item::BasicItemView;
use org::allbinary::business::user::commerce::inventory::item::ItemInterface;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntity;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::search::SearchRequest;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::visual::transform::StoreTransformer;
use org::allbinary::logic::visual::transform::data::TransformDocumentInterface;
use org::allbinary::logic::visual::transform::data::TransformStoreDocumentFactory;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpSearch;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::string::CommonStrings;

1;

