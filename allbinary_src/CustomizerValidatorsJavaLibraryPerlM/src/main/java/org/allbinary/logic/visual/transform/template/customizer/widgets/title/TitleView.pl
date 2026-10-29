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

package org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';

our $NAME = "None";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{title} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of TitleView takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{title} = $org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleView::NAME;
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $titleTextNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->getInstance()->{TEXT}, $node->getChildNodes());
        my $valueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::data::tree::dom::DomData::VALUE, $titleTextNode->getChildNodes());
        $self->{title} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($valueNode);
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{title})) {
            $self->{title} = $org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleView::NAME;
        }
        if ($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Title: " . $self->getTitle(), $self, "Consructor()");
        }
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("HashMap: " . $hashMap->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        $self->getFormData($hashMap);
    return $self;
}


sub getTitle {
    my ($self) = @_;
        return $self->{title};
}


sub getFormData {
    my ($self, $hashMap) = @_;
        $self->{title} = $hashMap->get('org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->getInstance()->{TEXT});
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{title})) {
            $self->{title} = $org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleView::NAME;
        }
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put('org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->getInstance()->{TEXT}, $self->getTitle());
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $hashMap = $self->toHashMap();
        if ($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::template::customizer::widgets::title::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("TitleView HashMap: " . $hashMap->toString(), $self, "toXmlNode()");
        }
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->getInstance()->{NAME}, $hashMap);
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomData;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData;

1;

