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

package org::allbinary::game::configuration::feature::GameFeatureFormUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();

our $instance = 'org::allbinary::game::configuration::feature::GameFeatureFormUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{meUtil} = 'org::allbinary::logic::MEUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::feature::GameFeatureFormUtil::instance;
}


sub getChoiceGroup {
    my ($self, $hashtable, $name, $option) = @_;
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        my $choiceGroup = 'javax::microedition::lcdui::ChoiceGroup'->new($name, $option, 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance(), $javax::microedition::lcdui::NullImage::NULL_IMAGE_ARRAY);
        my $list = $hashtable->get($name);
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        my $ADD_CHOICE = ": Adding Choice: ";
        my $GET_CHOICE_GROUP = "getChoiceGroup";
        my $size = $list->size();
        for (my $index = 0; $index < $size; $index++) {
            my $gameFeature = $list->{objectArray}->[$index];
            $stringMaker->delete(0, $stringMaker->length());
            $self->{logUtil}->putF($stringMaker->append($name)->append($ADD_CHOICE)->append($gameFeature->toString())->toString(), $self, $GET_CHOICE_GROUP);
            $choiceGroup->append($gameFeature->toString(), $javax::microedition::lcdui::NullImage::NULL_IMAGE);
            if ($features->isFeature($gameFeature)) {
                $choiceGroup->setSelectedIndex($index, 1);
            }
        }
        return $choiceGroup;
}


sub addChoiceGroup {
    my ($self, $form, $hashtable, $option) = @_;
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        my $ADDING_CHOICE_GROUP = "Adding Choice Group: ";
        my $ADD_CHOICE_GROUP = "addChoiceGroup";
        my $size = $hashtable->size();
        my $objectArray = 'org::allbinary::util::HashtableUtil'->getInstance()->getKeysAsArray($hashtable);
        my $name = undef;
        for (my $index = 0; $index < $size; $index++) {
            $name = $objectArray->[$index];
            $stringMaker->delete(0, $stringMaker->length());
            $self->{logUtil}->putF($stringMaker->append($ADDING_CHOICE_GROUP)->append($name)->toString(), $self, $ADD_CHOICE_GROUP);
            $self->{meUtil}->appendItem($form, $self->getChoiceGroup($hashtable, $name, $option));
        }
}


# throws Exception
sub setDefault {
    my ($self, $form) = @_;
        my $size = $form->size();
        for (my $index = 0; $index < $size; $index++) {
            my $item = $form->get($index);
            if ((Scalar::Util::blessed($item) && $item->isa('org::allbinary::game::configuration::GameConfigurationGauge'))) {
                'org::allbinary::game::configuration::GameConfigurationUtil'->getInstance()->setDefault($item);
            } elsif ((Scalar::Util::blessed($item) && $item->isa('javax::microedition::lcdui::ChoiceGroup'))) {
                'org::allbinary::game::configuration::feature::GameFeatureUtil'->getInstance()->setDefault($item);
            }
        }
}

# use javax::microedition::lcdui::ChoiceGroup;
# use javax::microedition::lcdui::Item;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::game::configuration::GameConfigurationGauge;
use org::allbinary::game::configuration::GameConfigurationUtil;
use org::allbinary::graphics::displayable::screen::CommandForm;
use org::allbinary::logic::MEUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::HashtableUtil;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureUtil;

1;

