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

package views::generic::inventory::InventorySearchUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'views::generic::inventory::InventorySearchUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{commonPhoneStrings} = 'org::allbinary::string::CommonPhoneStrings'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $views::generic::inventory::InventorySearchUtil::instance;
}


# throws Exception
sub getBasicItemIdColumn {
    my ($self, $searchRequest) = @_;
        my $inventoryEntityInterface = 'org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory'->getInstance()->getInventoryEntityInstance();
        my $storeFrontInterface = $searchRequest->getStoreFront();
        my $inventorySearchUtil = 'views::generic::inventory::InventoryColumnUtil'->getInstance();
        my $column = $inventorySearchUtil->getColumnWhereLike($inventoryEntityInterface, $storeFrontInterface->getCategoryPath(), $self->{basicItemData}->{ID});
        if ($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRODUCTSEARCHLOGGING})) {
            $self->{logUtil}->putF("Number Of Items Found: " . $column->size(), $self, "search");
        }
        my $subStoreVector = $storeFrontInterface->getSubStores();
        my $size = $subStoreVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $subStore = $subStoreVector->get($index);
            my $substoreIdColumn = $inventorySearchUtil->getColumnWhereLike($inventoryEntityInterface, $subStore, $self->{basicItemData}->{ID});
            $column->addAllList($substoreIdColumn);
        }
        if ($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRODUCTSEARCHLOGGING})) {
            $self->{logUtil}->putF("Number Of Items Found Including SubStores: " . $column->size(), $self, "search");
        }
        return $column;
}


# throws Exception
sub getNoResults {
    my ($self, $viewDocumentInterface, $inventoryNode) = @_;
        $inventoryNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($viewDocumentInterface->getDoc(), $org::allbinary::logic::control::search::SearchData::TOTAL_NUMBER_PAGES, $self->{commonPhoneStrings}->{ZERO}));
        $inventoryNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($viewDocumentInterface->getDoc(), $org::allbinary::logic::control::search::SearchData::TOTAL_NUMBER_ITEMS, $self->{commonPhoneStrings}->{ZERO}));
        my $success = 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($viewDocumentInterface->getDoc());
        if ($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRODUCTSEARCHLOGGING})) {
            $self->{logUtil}->putF("No Results Xml: " . $success, $self, "search");
        }
        return $success;
}


sub search {
    my ($self, $abeClientInformation, $searchRequest, $column) = @_;
        try {
            my $inventoryEntityInterface = 'org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory'->getInstance()->getInventoryEntityInstance();
            my $searchParams = $searchRequest->getParams();
            my $startPage = int($searchParams->getStartPageInt());
            my $endPage = int($searchParams->getEndPageInt());
            my $pageLength = int($searchParams->getLengthInt());
            my $savedPagesInRange = 0;
            my $columnValueHashMap = $searchParams->get();
            my $keyword = 'org::allbinary::logic::string::regex::replace::Replace'->new("-", 'org::allbinary::string::CommonSeps'->getInstance()->{SPACE})->all($columnValueHashMap->get($self->{basicItemData}->{KEYWORDS}));
            if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($keyword)) {
                return undef;
            }
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if ($startPage >= 0) {
                if ($pageLength == 0) {
                    $pageLength = $org::allbinary::logic::control::search::SearchData::DEFAULT_PAGE_LENGTH;
                }
                my $MAXPAGES = 100;
                my $productListingPages = [(undef) x ($MAXPAGES)];
                my $documents = [(undef) x ($MAXPAGES)];
                my $inventoryNodes = [(undef) x ($MAXPAGES)];
                $keyword = uc($keyword);
                my $lastPage = -1;
                my $numberOfResultsOnCurrentPage = 0;
                my $numberOfResults = 0;
                my $viewDocumentInterface = 'org::allbinary::logic::visual::transform::data::TransformStoreDocumentFactory'->getInstance($searchRequest);
                my $inventoryNode = $viewDocumentInterface->getDoc()->createElement($org::allbinary::business::user::commerce::inventory::InventoryData::INVENTORY);
                $viewDocumentInterface->getBaseNode()->appendChild($inventoryNode);
                $inventoryNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($viewDocumentInterface->getDoc(), $org::allbinary::logic::control::search::SearchData::PAGE, $startPage->toString()));
                if (defined($searchRequest->getFileBaseName())) {
                    $inventoryNode->appendChild($searchRequest->getFileBaseNameNode($viewDocumentInterface->getDoc()));
                }
                my $currentPage = -1;
                my $size = $column->size();
                for (my $index = 0; $index < $size; $index++) {
                    my $product = ("" . $column->get($index));
                    my $itemInterface = $inventoryEntityInterface->getItem($product);
                    my $keywords = $itemInterface->getKeywords();
                    $keywords = uc($keywords);
                    if (index($keywords, $keyword) != -1) {
                        if ($currentPage + 1 >= $startPage && $currentPage + 1 <= $endPage) {
                            my $itemNode = 'org::allbinary::business::user::commerce::inventory::item::BasicItemView'->new($itemInterface, 'org::allbinary::util::BasicArrayListD'->new())->toXmlNode($viewDocumentInterface->getDoc());
                            $itemNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($viewDocumentInterface->getDoc(), $org::allbinary::business::user::commerce::inventory::basket::BasketData::ITEMTOTALINBASKET, $self->{commonPhoneStrings}->{ONE}));
                            $inventoryNode->appendChild($itemNode->cloneNode(1));
                        }
                        $currentPage = (int(($numberOfResults + 1) / $pageLength)) - 1;
                        $numberOfResultsOnCurrentPage++;
                        if ($lastPage < $currentPage) {
                            if ($currentPage >= $startPage && $currentPage <= $endPage) {
                                $inventoryNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($viewDocumentInterface->getDoc(), $org::allbinary::logic::control::search::SearchData::TOTAL_NUMBER_ITEMS_ON_THIS_PAGE, $numberOfResultsOnCurrentPage->toString()));
                                $documents->[$currentPage] = $viewDocumentInterface->getDoc();
                                $inventoryNodes->[$currentPage] = $inventoryNode;
                                $savedPagesInRange++;
                                $viewDocumentInterface = 'org::allbinary::logic::visual::transform::data::TransformStoreDocumentFactory'->getInstance($searchRequest);
                                $inventoryNode = $viewDocumentInterface->getDoc()->createElement($org::allbinary::business::user::commerce::inventory::InventoryData::INVENTORY);
                                $viewDocumentInterface->getBaseNode()->appendChild($inventoryNode);
                                $inventoryNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($viewDocumentInterface->getDoc(), $org::allbinary::logic::control::search::SearchData::PAGE, $currentPage + 1->toString()));
                                if (defined($searchRequest->getFileBaseName())) {
                                    $inventoryNode->appendChild($searchRequest->getFileBaseNameNode($viewDocumentInterface->getDoc()));
                                }
                            }
                            $lastPage = $currentPage;
                            $numberOfResultsOnCurrentPage = 0;
                        }
                        $numberOfResults++;
                        if ($lastPage >= $MAXPAGES - 1) {
                            last;
                        }
                    }
                }
                if ($numberOfResultsOnCurrentPage > 0 && ($currentPage + 1 >= $startPage && $currentPage + 1 <= $endPage)) {
                    $inventoryNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($viewDocumentInterface->getDoc(), $org::allbinary::logic::control::search::SearchData::TOTAL_NUMBER_ITEMS_ON_THIS_PAGE, $numberOfResultsOnCurrentPage - 1->toString()));
                    $documents->[$lastPage + 1] = $viewDocumentInterface->getDoc();
                    $inventoryNodes->[$lastPage + 1] = $inventoryNode;
                    $savedPagesInRange++;
                }
                if ($numberOfResultsOnCurrentPage > 0) {
                    $lastPage++;
                }
                if ($endPage > $MAXPAGES - 1) {
                    $endPage = $MAXPAGES - 1;
                }
                for (my $index = $startPage; $index <= $endPage; $index++) {
                    if ($index <= $lastPage) {
                        my $tempDocument = $documents->[$index];
                        $inventoryNodes->[$index]->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($tempDocument, $org::allbinary::logic::control::search::SearchData::TOTAL_NUMBER_PAGES, $lastPage + 1->toString()));
                        $inventoryNodes->[$index]->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($tempDocument, $org::allbinary::logic::control::search::SearchData::TOTAL_NUMBER_ITEMS, $numberOfResults->toString()));
                        for (my $pageIndex = 0; $pageIndex <= $lastPage; $pageIndex++) {
                            $stringBuffer->delete(0, $stringBuffer->length());
                            $stringBuffer->append($searchRequest->getFileBaseName());
                            if ($stringBuffer->length() > 0) {
                                if ($pageIndex != 0) {
                                    $stringBuffer->append(("" . ($pageIndex)));
                                }
                                $inventoryNodes->[$index]->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($tempDocument, $org::allbinary::logic::control::search::SearchData::PAGE_INFO, ("" . ($pageIndex)), $stringBuffer->toString()));
                            } else {
                                $inventoryNodes->[$index]->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($tempDocument, $org::allbinary::logic::control::search::SearchData::PAGE_INFO, ("" . ($pageIndex)), $org::allbinary::logic::control::search::SearchData::SEARCH));
                            }
                        }
                        my $success = 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($tempDocument);
                        $productListingPages->[$index] = 'org::allbinary::logic::visual::transform::StoreTransformer'->new($abeClientInformation, 'org::allbinary::logic::visual::transform::info::TransformInfoHttpSearch'->new($searchRequest))->translate($success);
                    }
                }
                if ($savedPagesInRange == 0) {
                    my $result = $self->getNoResults($viewDocumentInterface, $inventoryNode);
                    $productListingPages->[0] = 'org::allbinary::logic::visual::transform::StoreTransformer'->new($abeClientInformation, 'org::allbinary::logic::visual::transform::info::TransformInfoHttpSearch'->new($searchRequest))->translate($result);
                }
                return $productListingPages;
            } else {
                return undef;
            }
        } catch ($e) {
            if ($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::generic::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PRODUCTSEARCHLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "search", $e);
            }
            return undef;
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::inventory::InventoryData;
use org::allbinary::business::user::commerce::inventory::basket::BasketData;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::business::user::commerce::inventory::item::BasicItemView;
use org::allbinary::business::user::commerce::inventory::item::ItemInterface;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntity;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::search::SearchData;
use org::allbinary::logic::control::search::SearchParams;
use org::allbinary::logic::control::search::SearchRequest;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::string::regex::replace::Replace;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::visual::transform::StoreTransformer;
use org::allbinary::logic::visual::transform::data::TransformDocumentInterface;
use org::allbinary::logic::visual::transform::data::TransformStoreDocumentFactory;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpSearch;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::generic::inventory::InventoryColumnUtil;

1;

