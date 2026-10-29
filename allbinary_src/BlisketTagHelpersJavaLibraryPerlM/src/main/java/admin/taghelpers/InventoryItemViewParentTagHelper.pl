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

package admin::taghelpers::InventoryItemViewParentTagHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();

our $instance = 'admin::taghelpers::InventoryItemViewParentTagHelper'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $admin::taghelpers::InventoryItemViewParentTagHelper::instance;
}


# throws Exception
sub getInventoryItemView {
    my ($self, $inventoryTag) = @_;
        if (defined($inventoryTag)) {
            $self->checkForValidationViewHelper($inventoryTag->getHelper());
            my $validationViewHelper = $inventoryTag->getHelper();
            my $viewObject = $validationViewHelper->getViewObject();
            if ($viewObject->getTypeId() != $views::admin::inventory::InventoryItemView::TYPE_ID) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Must have ");
                $stringBuffer->append("InventoryItemView and not: ");
                $stringBuffer->append(ref($inventoryTag->getHelper()));
                die ($stringBuffer->toString());
            }
            return $viewObject;
        } else {
            die ("Must have parent tag.");
        }
}


# throws Exception
sub getDownloadableInventoryItemView {
    my ($self, $inventoryTag) = @_;
        if (defined($inventoryTag)) {
            $self->checkForValidationViewHelper($inventoryTag->getHelper());
            my $validationViewHelper = $inventoryTag->getHelper();
            my $viewObject = $validationViewHelper->getViewObject();
            if ($viewObject->getTypeId() != $views::admin::inventory::download::DownloadableInventoryItemView::TYPE_ID) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Must have ");
                $stringBuffer->append("DownloadableInventoryItemView and not: ");
                $stringBuffer->append(ref($inventoryTag->getHelper()));
                die ($stringBuffer->toString());
            }
            return $viewObject;
        } else {
            die ("Must have parent tag.");
        }
}


# throws Exception
sub getRequestMapInterface {
    my ($self, $inventoryTag) = @_;
        if (defined($inventoryTag)) {
            $self->checkForValidationViewHelper($inventoryTag->getHelper());
            my $validationViewHelper = $inventoryTag->getHelper();
            my $viewObject = $validationViewHelper->getViewObject();
            if ($viewObject->getTypeId() != $views::admin::inventory::InventoryItemView::TYPE_ID && $viewObject->getTypeId() != $views::admin::inventory::download::DownloadableInventoryItemView::TYPE_ID) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Must have ");
                $stringBuffer->append("specific TYPE_ID and not: ");
                $stringBuffer->append(ref($inventoryTag->getHelper()));
                die ($stringBuffer->toString());
            }
            return $viewObject;
        } else {
            die ("Must have parent tag.");
        }
}


# throws Exception
sub checkForValidationViewHelper {
    my ($self, $helperObject) = @_;
        if (!((Scalar::Util::blessed($helperObject) && $helperObject->isa('taghelpers::ValidationViewHelper')))) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Must have ");
            $stringBuffer->append("ValidationViewHelper");
            $stringBuffer->append("and not: ");
            $stringBuffer->append(ref($helperObject));
            die ($stringBuffer->toString());
        }
}

use org::allbinary::logic::communication::http::request::RequestMapInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::TransformInterface;
use taghelpers::ValidationViewHelper;
use tags::HelperTag;
use views::admin::inventory::InventoryItemView;
use views::admin::inventory::download::DownloadableInventoryItemView;

1;

