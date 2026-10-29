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

package admin::taghelpers::CategoryRequestHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::ModifyTable';

our $categoryRequest = 'org::allbinary::logic::string::StringMaker'->new()->append("<")->append('org::allbinary::business::category::CategoryData'->getInstance()->{REQUEST})->append(">")->toString();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{pageContext} = undef;
    $self->{hashMap} = undef;
    $self->{request} = undef;
    $self->{categoryLoaderInterface} = undef;
    $self->{categoryInterface} = undef;
    $self->{childCategoryInterface} = undef;
    $self->{transformInfoInterface} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        try {
            $self->{request} = $pageContext->getRequest();
            $self->{pageContext} = $pageContext;
            $self->{hashMap} = $hashMap;
            $self->getXmlData();
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "CategoryRequestHelper()", $e);
            }
        }
    return $self;
}


sub getXmlData {
    my ($self) = @_;
        try {
            my $map = $self->{request}->getParameterMap();
            my $categoryData = 'org::allbinary::business::category::CategoryData'->getInstance();
            my $keys = $map->keySet();
            my $keyArray = $keys->toArray();
            my $size = scalar(@{$keyArray});
            if ($size > 0) {
                my $xmlRequest = $keyArray->[0];
                my $index = 1;
                while ($index < $size && !(index($xmlRequest, $admin::taghelpers::CategoryRequestHelper::categoryRequest) == 0)) {
                    $xmlRequest = $keyArray->[$index];
                    if ((index($xmlRequest, $admin::taghelpers::CategoryRequestHelper::categoryRequest) == 0)) {
                        last;
                    }
                }
                if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                    $self->{logUtil}->putF($xmlRequest, $self, "getXmlData()");
                }
                my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($xmlRequest);
                my $requestNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($categoryData->{REQUEST}, $document->getChildNodes());
                if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                    $self->{logUtil}->putF('org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($document), $self, "getXmlData()");
                }
                $self->setCategoryLoader($requestNode);
                my $parentCategoryNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($categoryData->{PARENT}, $requestNode->getChildNodes());
                my $categoryNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($categoryData->{NAME}, $parentCategoryNode->getChildNodes());
                $self->{categoryInterface} = 'org::allbinary::business::category::store::StoreCategoryFactory'->new($self->{transformInfoInterface})->getRootInstanceFromNode($categoryNode);
                $self->{categoryInterface} = $self->{categoryLoaderInterface}->get($self->{categoryInterface});
                if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                    $self->{categoryInterface}->log();
                    $self->{logUtil}->putF("Loaded Parent Category", $self, "getXmlData()");
                }
                my $childCategoryNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($categoryData->{NAME}, $requestNode->getChildNodes());
                if (defined($childCategoryNode)) {
                    if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                        $self->{logUtil}->putF("Loading Child Category", $self, "getXmlData()");
                    }
                    $self->{childCategoryInterface} = 'org::allbinary::business::category::store::StoreCategoryFactory'->new($self->{transformInfoInterface})->getInstance($childCategoryNode);
                    if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPER})) {
                        $self->{childCategoryInterface}->log();
                        $self->{logUtil}->putF("Loaded Child Category", $self, "getXmlData()");
                    }
                } else {
                    $self->{childCategoryInterface} = $self->{categoryInterface};
                }
            }
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getXmlData()", $e);
            }
        }
}


# throws Exception
sub setCategoryLoader {
    my ($self, $requestNode) = @_;
        my $storeNameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $requestNode->getChildNodes());
        if (defined($storeNameNode)) {
            my $storeName = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($storeNameNode);
            if (defined($storeName)) {
                my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($storeName);
                $self->{transformInfoInterface} = 'org::allbinary::logic::visual::transform::info::TransformInfoBasic'->new($storeFrontInterface, $self->{hashMap}, $self->{pageContext});
                if (!defined($self->{transformInfoInterface})) {
                    die ("TransformInfo null");
                }
                my $storeCategoryFactory = 'org::allbinary::business::category::store::StoreCategoryFactory'->new($self->{transformInfoInterface});
                $self->{categoryLoaderInterface} = 'org::allbinary::data::tree::category::CategoryLoaderFactory'->getInstance($storeCategoryFactory);
            } else {
                die ("Store Name Error: " . $storeName);
            }
        }
}


sub insert {
    my ($self) = @_;
        try {
            my $success = "Successfully Added the following to the Category table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF("inserting", $self, "insert()");
            }
            $self->{categoryLoaderInterface}->insert($self->{categoryInterface}, $self->{childCategoryInterface});
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "insert()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to add item to Category";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "insert()", $e);
            }
            return $error;
        }
}


sub delete {
    my ($self) = @_;
        try {
            my $success = "Successfully Removed " . 'org::allbinary::business::category::CategoryData'->getInstance()->{NAME} . "=" . $self->{childCategoryInterface}->getPath();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF("Deleting", $self, "delete()");
            }
            $self->{categoryLoaderInterface}->delete($self->{categoryInterface}, $self->{childCategoryInterface});
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "delete()");
            }
            return $success;
        } catch ($e) {
            try {
                my $error = "Failed to remove category: " . $self->{childCategoryInterface}->getPath();
                if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                    $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "delete()", $e);
                }
                return $error;
            } catch ($e2) {
                my $error = "Failed to remove category and show the path of the failed category";
                if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                    $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "delete()", $e2);
                }
                return $error;
            }
        }
}


sub viewCategory {
    my ($self) = @_;
        try {
            my $document = 'org::allbinary::business::category::CategoryComponent'->new($self->{childCategoryInterface})->toXmlDoc();
            my $xmlString = 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($document);
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($xmlString, $self, "viewCategory()");
            }
            return $xmlString;
        } catch ($e) {
            my $error = "Failed to get Category";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "viewCategory()", $e);
            }
            return $error;
        }
}


sub viewCategories {
    my ($self) = @_;
        try {
            my $success = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "viewCategories()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to view Categories table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "viewCategories()", $e);
            }
            return $error;
        }
}


sub update {
    my ($self) = @_;
        try {
            my $success = "New Item Successfully added";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "update()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to add Item";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "update()", $e);
            }
            return $error;
        }
}

use java::util::HashMap;
# use java::util::Map;
# use java::util::Set;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::category::CategoryComponent;
use org::allbinary::business::category::CategoryData;
use org::allbinary::business::category::CategoryInterface;
use org::allbinary::business::category::store::StoreCategoryFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::data::tree::category::CategoryLoaderFactory;
use org::allbinary::data::tree::category::CategoryLoaderInterface;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoBasic;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use admin::taghelpers::ModifyTable;

1;

