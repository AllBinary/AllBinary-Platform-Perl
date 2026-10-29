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

package views::admin::storefront::DeleteValidationStoreFrontView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::admin::storefront::StoreFrontComponent','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            my $valid = 1;
            if ($self->{newStoreFrontInterface}->isNameValid() == 0) {
                $valid = 0;
            }
            if (!defined('org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->{newStoreFrontInterface}->getName()))) {
                $valid = 0;
            }
            $self->{newStoreFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->{newStoreFrontInterface}->getName());
            return $valid;
        } catch ($e) {
            if ($views::admin::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if ($self->{newStoreFrontInterface}->isNameValid() == 0) {
                $stringBuffer->append($self->{newStoreFrontInterface}->nameValidationInfo());
            }
            if (!defined('org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->{newStoreFrontInterface}->getName()))) {
                $stringBuffer->append($self->{newStoreFrontInterface} . " does not exist.<br>");
            }
            return "Unkown Error";
        } catch ($e) {
            if ($views::admin::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Validating Form";
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

use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::admin::storefront::StoreFrontComponent;

1;

