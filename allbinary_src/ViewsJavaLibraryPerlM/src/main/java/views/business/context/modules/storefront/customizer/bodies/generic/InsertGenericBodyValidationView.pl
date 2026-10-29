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

package views::business::context::modules::storefront::customizer::bodies::generic::InsertGenericBodyValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::customizer::bodies::generic::GenericBodyCustomizerView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        my $requestHashMap = 'org::allbinary::logic::communication::http::request::RequestParams'->new($self->getPageContext())->toHashMap();
        $self->{body} = 'org::allbinary::logic::visual::transform::template::customizer::bodies::GenericBodyValidation'->new($requestHashMap);
    return $self;
}


# throws Exception
sub toXmlDoc {
    my ($self) = @_;
        return undef;
}


sub isValid {
    my ($self) = @_;
        try {
            if ($views::business::context::modules::storefront::customizer::bodies::generic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::bodies::generic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Started Validation", $self, $self->{commonStrings}->{IS_VALID});
            }
            my $isValid = $self->{body}->isValid();
            if ($isValid == 1) {
                'views::business::context::modules::storefront::customizer::CustomizerUtil'->getInstance()->insert($self->getTransformInfoInterface(), $self->{body});
            }
            return $isValid;
        } catch ($e) {
            if ($views::business::context::modules::storefront::customizer::bodies::generic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::bodies::generic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->{body}->validationInfo());
            return $stringBuffer->toString();
        } catch ($e) {
            if ($views::business::context::modules::storefront::customizer::bodies::generic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::bodies::generic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Getting Validation Info";
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


# throws Exception
sub view {
    my ($self) = @_;
        try {
            return 'views::business::context::modules::storefront::customizer::StoreCustomizerComponentUtil'->getInstance()->generate($self->{abeClientInformation}, $self->getTransformInfoInterface());
        } catch ($e) {
            if ($views::business::context::modules::storefront::customizer::bodies::generic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::bodies::generic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::template::customizer::bodies::GenericBodyValidation;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::customizer::CustomizerUtil;
use views::business::context::modules::storefront::customizer::StoreCustomizerComponentUtil;
use views::business::context::modules::storefront::customizer::bodies::generic::GenericBodyCustomizerView;

1;

