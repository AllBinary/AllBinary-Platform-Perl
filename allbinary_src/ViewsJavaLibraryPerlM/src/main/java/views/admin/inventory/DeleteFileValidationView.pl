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

package views::admin::inventory::DeleteFileValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::admin::inventory::InventoryItemView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{id} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
    $self->_init_fields();
        # super(...) made $self above
        $self->getFormData();
    return $self;
}


# throws Exception
sub getFormData {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::communication::http::request::RequestParams'->new($self->{request})->toHashMap();
        if (!defined($hashMap)) {
            die ("No Request Params Found");
        }
        $self->{id} = $hashMap->get($self->{basicItemData}->{ID});
}


sub isValid {
    my ($self) = @_;
        try {
            if (!defined($self->{id}) || !'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isNumber($self->{id})) {
                return 0;
            }
            $self->{itemInterface} = 'org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory'->getInstance()->getInventoryEntityInstance()->getItem($self->{id});
            if (!defined($self->{itemInterface})) {
                return 0;
            }
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
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if (!defined($self->{id}) || !'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isNumber($self->{id})) {
                $stringBuffer->append("Id is not valid.<br />");
            }
            if (!defined('org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory'->getInstance()->getInventoryEntityInstance()->getItem($self->{id}))) {
                $stringBuffer->append("Item does not exist.<br />");
            }
            return $stringBuffer->toString();
        } catch ($e) {
            return "Unkown Validation Error.<br />";
        }
}

use java::util::HashMap;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::admin::inventory::InventoryItemView;

1;

