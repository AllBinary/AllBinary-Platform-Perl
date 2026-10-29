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

package views::admin::inventory::NewValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::admin::inventory::InventoryItemView','org::allbinary::logic::control::validate::ValidationComponentInterface';



sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        # super(...) made $self above
        $self->{itemInterface} = 'org::allbinary::business::user::commerce::inventory::item::BasicItem'->new();
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            return 1;
        } catch ($e) {
            return 0;
        }
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


sub validationInfo {
    my ($self) = @_;
        return "Error Creating New Item";
}

use org::allbinary::business::user::commerce::inventory::item::BasicItem;
use org::allbinary::business::user::commerce::inventory::item::ItemInterface;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::admin::inventory::InventoryItemView;

1;

