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

package org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptCondition;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::actions::script::condition::BasicProfileActionScriptCondition','org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionInterface';

our $NAME = "If Color At";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{colorAtActionScriptConditionJPanel} = undef;
    $self->{point} = undef;
    $self->{colorRangeInterface} = 'org::allbinary::media::image::analysis::ColorRange'->new();
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of ColorAtActionScriptCondition takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = $class->SUPER::new($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptCondition::NAME, $node);
    $self->_init_fields();
        # super(...) made $self above
        $self->{point} = 'java::awt::Point'->new(0, 0);
        my $actionNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::NAME, $node->getChildNodes());
        if (defined($actionNode)) {
            my $nodeList = $actionNode->getChildNodes();
            for (my $index = 0; $index < $nodeList->getLength(); $index++) {
                my $childNode = $nodeList->item($index);
                if ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::LOCATION_X) == 0) {
                    my $locationX = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->{point}->{x} = ("" . ($locationX));
                } elsif ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::LOCATION_Y) == 0) {
                    my $locationY = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->{point}->{y} = ("" . ($locationY));
                } elsif ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::MIN_RED) == 0) {
                    my $string = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->getColorRangeInterface()->setMinRed(("" . ($string)));
                } elsif ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::MAX_RED) == 0) {
                    my $string = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->getColorRangeInterface()->setMaxRed(("" . ($string)));
                } elsif ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::MIN_GREEN) == 0) {
                    my $string = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->getColorRangeInterface()->setMinGreen(("" . ($string)));
                } elsif ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::MAX_GREEN) == 0) {
                    my $string = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->getColorRangeInterface()->setMaxGreen(("" . ($string)));
                } elsif ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::MIN_BLUE) == 0) {
                    my $string = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->getColorRangeInterface()->setMinBlue(("" . ($string)));
                } elsif ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::MAX_BLUE) == 0) {
                    my $string = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                    $self->getColorRangeInterface()->setMaxBlue(("" . ($string)));
                }
            }
        } else {
            die ("Color At Action Script Condition Node Null");
        }
        $self->init();
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptCondition::NAME);
    $self->_init_fields();
        # super(...) made $self above
        $self->{point} = 'java::awt::Point'->new(0, 0);
        $self->init();
    return $self;
}


sub init {
    my ($self) = @_;
        $self->{colorAtActionScriptConditionJPanel} = 'org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionJPanel'->new($self);
}


sub getPoint {
    my ($self) = @_;
        return $self->{point};
}


sub setPoint {
    my ($self, $point) = @_;
        $self->{point} = $point;
}


sub showDialog {
    my ($self) = @_;
        $self->{colorAtActionScriptConditionJPanel}->getColorAtActionJDialog()->setVisible(1);
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::LOCATION_X, ("" . ($self->getPoint()->{x})));
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::LOCATION_Y, ("" . ($self->getPoint()->{y})));
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::MIN_RED, ("" . ($self->getColorRangeInterface()->getMinRed())));
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::MAX_RED, ("" . ($self->getColorRangeInterface()->getMaxRed())));
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::MIN_GREEN, ("" . ($self->getColorRangeInterface()->getMinGreen())));
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::MAX_GREEN, ("" . ($self->getColorRangeInterface()->getMaxGreen())));
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::MIN_BLUE, ("" . ($self->getColorRangeInterface()->getMinBlue())));
        $hashMap->put($org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::MAX_BLUE, ("" . ($self->getColorRangeInterface()->getMaxBlue())));
        $self->{logUtil}->putF("HashMap: " . $hashMap->toString(), $self, "toHashMap()");
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $self->SUPER::toXmlNode($document);
        $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, $org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData::NAME, $self->toHashMap()));
        return $node;
}


# throws Exception
sub shouldProcess {
    my ($self, $frame) = @_;
        my $capturedBufferedImageCacheable = ('org::allbinary::input::media::image::capture::CapturedBufferedImagesCacheSingleton'->getInstance())->get(("" . ($frame)));
        my $bufferedImage = $capturedBufferedImageCacheable->getBufferedImage();
        my $automaticCacheInterface = 'org::allbinary::graphics::color::ColorCacheFactory'->getInstance();
        my $colorInteger = ("" . ($bufferedImage->getRGB($self->getPoint()->{x}, $self->getPoint()->{y})));
        my $colorCacheable = $automaticCacheInterface->get($colorInteger);
        my $color = $colorCacheable->getColor();
        if ($self->{colorRangeInterface}->isInRange($color)) {
            return $self->SUPER::shouldProcess($frame);
        }
        return 0;
}


sub log {
    my ($self) = @_;
        my $message = 'org::allbinary::logic::string::StringMaker'->new()->append("getPoint(): ")->append($self->getPoint()->toString())->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE})->append($self->getColorRangeInterface()->toString())->toString();
        $self->{logUtil}->putF($message, $self, "log");
}


sub getColorRangeInterface {
    my ($self) = @_;
        return $self->{colorRangeInterface};
}


sub setColorRangeInterface {
    my ($self, $colorRangeInterface) = @_;
        $self->{colorRangeInterface} = $colorRangeInterface;
}

# use java::awt::Color;
# use java::awt::Point;
# use java::awt::image::BufferedImage;
use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::graphics::color::ColorCacheFactory;
use org::allbinary::graphics::color::ColorCacheable;
use org::allbinary::input::media::image::capture::CapturedBufferedImagesCacheSingleton;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::cache::AutomaticCacheInterface;
use org::allbinary::media::image::analysis::ColorRange;
use org::allbinary::media::image::analysis::ColorRangeInterface;
use org::allbinary::media::image::cache::BufferedImageFrameCacheable;
use org::allbinary::string::CommonSeps;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::input::automation::actions::script::condition::BasicProfileActionScriptCondition;
use org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionInterface;
use org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionData;
use org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionJPanel;

1;

