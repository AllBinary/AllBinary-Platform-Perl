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

package views::business::context::modules::storefront::customizer::bodies::generic::GenericBodyCustomizerView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::data::tree::dom::DomNodeInterface';

our $NAME = "None";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{body} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub addDomNodeInterfaces {
    my ($self) = @_;
        $self->addDomNodeInterface($self->{body});
        $self->addDomNodeInterface($self);
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $pageName = 'org::allbinary::logic::visual::transform::template::util::TransformTemplateCustomizerUtil'->getInstance()->getPageNameHack($self->getTransformInfoInterface()->getName(), $self->getWeblisketSession()->getStoreName());
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($pageName)) {
            $pageName = $views::business::context::modules::storefront::customizer::bodies::generic::GenericBodyCustomizerView::NAME;
        }
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::business::page::PageData'->getInstance()->{NAME}, $pageName);
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            $self->addDomNodeInterfaces();
            my $success = 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($self->getDoc());
            my $result = 'org::allbinary::logic::visual::transform::StoreTransformer'->new($self->{abeClientInformation}, $self->getTransformInfoInterface())->translate($success);
            return 'org::apache::commons::lang3::StringEscapeUtils'->unescapeHtml3($result);
        } catch ($e) {
            if ($views::business::context::modules::storefront::customizer::bodies::generic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::bodies::generic::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}

use org::allbinary::business::page::PageData;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::StoreTransformer;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::template::customizer::bodies::GenericBodyValidation;
use org::allbinary::logic::visual::transform::template::util::TransformTemplateCustomizerUtil;
use org::apache::commons::lang3::StringEscapeUtils;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

