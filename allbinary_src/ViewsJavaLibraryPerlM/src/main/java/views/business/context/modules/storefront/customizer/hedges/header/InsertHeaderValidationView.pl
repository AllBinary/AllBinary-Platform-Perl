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

package views::business::context::modules::storefront::customizer::hedges::header::InsertHeaderValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::customizer::hedges::header::TopBarView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{LOGOPATH} = "logo/";
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        my $multipartRequestHashMap = 'org::allbinary::logic::communication::http::request::MultipartRequestParams'->new($self->getPageContext())->toHashMap();
        my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->getWeblisketSession()->getStoreName());
        my $fullPath = 'org::allbinary::globals::URLGLOBALS'->getWebappPath() + $storeFrontInterface->getCurrentHostNamePath() . $self->{LOGOPATH};
        $multipartRequestHashMap->put('org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData'->getInstance()->{IMAGEPATH}, $fullPath);
        $self->{heading} = 'org::allbinary::logic::visual::transform::template::customizer::hedges::heading::HeadingValidation'->new($multipartRequestHashMap);
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
            if ($views::business::context::modules::storefront::customizer::hedges::header::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::hedges::header::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("topbarValidation", $self, $self->{commonStrings}->{IS_VALID});
            }
            my $isValid = $self->{heading}->isValid();
            if ($isValid == 1) {
                'views::business::context::modules::storefront::customizer::CustomizerUtil'->getInstance()->insert($self->getTransformInfoInterface(), $self);
            }
            return $isValid;
        } catch ($e) {
            if ($views::business::context::modules::storefront::customizer::hedges::header::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::hedges::header::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->{heading}->validationInfo());
            return $stringBuffer->toString();
        } catch ($e) {
            if ($views::business::context::modules::storefront::customizer::hedges::header::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::hedges::header::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
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

use java::util::HashMap;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::http::request::MultipartRequestParams;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::template::customizer::hedges::heading::HeadingValidation;
use org::allbinary::logic::visual::transform::template::customizer::widgets::logo::LogoData;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::customizer::CustomizerUtil;
use views::business::context::modules::storefront::customizer::hedges::header::TopBarView;

1;

