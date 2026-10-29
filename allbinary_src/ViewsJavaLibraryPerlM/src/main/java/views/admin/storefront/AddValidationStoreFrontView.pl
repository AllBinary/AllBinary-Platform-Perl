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

package views::admin::storefront::AddValidationStoreFrontView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::HttpContextView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{newStoreFrontInterface} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{newStoreFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFront'->new($self->getPageContext()->getRequest());
        if (!defined($self->{newStoreFrontInterface}->getName())) {
            $self->{newStoreFrontInterface}->setName($self->getWeblisketSession()->getStoreName());
        }
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            my $valid = 1;
            if ($self->{newStoreFrontInterface}->isValid() == 0) {
                $valid = 0;
            }
            if (defined('org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->{newStoreFrontInterface}->getName()))) {
                $valid = 0;
            }
            if ('org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath('org::allbinary::logic::io::path::AbPath'->new($self->getStoreViewsPath(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}))->isFile()) {
                $valid = 0;
            }
            return $valid;
        } catch ($e) {
            if ($views::admin::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate form", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


# throws Exception
sub getStoreViewsPath {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getMainPath());
        $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH});
        $stringBuffer->append($self->{newStoreFrontInterface}->getName());
        return $stringBuffer->toString();
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if ($self->{newStoreFrontInterface}->isValid() == 0) {
                $stringBuffer->append($self->{newStoreFrontInterface}->validationInfo());
            }
            if (defined('org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->{newStoreFrontInterface}->getName()))) {
                $stringBuffer->append("Store name already used<br/>");
            }
            if ('org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath('org::allbinary::logic::io::path::AbPath'->new($self->getStoreViewsPath(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}))->isFile()) {
                $stringBuffer->append("Store name clashes with template name<br/>");
            }
            return $stringBuffer->toString();
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


# throws Exception
sub view {
    my ($self) = @_;
        return $self->{views}->{ValidationOnlyTempUtil}->getInstance()->view($self);
}

# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::context::modules::storefront::StoreFront;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::HttpContextView;

1;

