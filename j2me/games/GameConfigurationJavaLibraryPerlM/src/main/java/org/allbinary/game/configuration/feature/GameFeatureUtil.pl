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

package org::allbinary::game::configuration::feature::GameFeatureUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::configuration::feature::GameFeatureUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
    $self->{enumerationUtil} = 'org::allbinary::util::EnumerationUtil'->getInstance();
    $self->{ON_GAME_FEATURE_CHANGE} = "onGameFeatureChange";
    $self->{GAME_FEATURE_CHANGED} = "Game Feature Changed: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::feature::GameFeatureUtil::instance;
}


# throws Exception
sub setDefault {
    my ($self, $choiceGroup) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $METHOD_NAME = "setDefault";
        my $SELECTED_ARRAY_RETURN = "selectedArray_return[";
        my $SELECTED_SEP = "] = ";
        my $selectedArray_return = [(0) x ($choiceGroup->size())];
        my $total = $choiceGroup->getSelectedFlags($selectedArray_return);
        $stringBuffer->append("Multiple Total Choices: ");
        $stringBuffer->appendint($total);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $METHOD_NAME);
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        for (my $index = 0; $index < scalar(@{$selectedArray_return}); $index++) {
            my $isSelected = $selectedArray_return->[$index];
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append($SELECTED_ARRAY_RETURN);
            $stringBuffer->appendint($index);
            $stringBuffer->append($SELECTED_SEP);
            $stringBuffer->appendboolean($isSelected);
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $METHOD_NAME);
            my $selectedChoiceLabel = $choiceGroup->getString($index);
            my $gameFeature = 'org::allbinary::game::configuration::feature::Feature'->getInstance($selectedChoiceLabel);
            if ($features->isDefault($gameFeature)) {
                $features->add($gameFeature);
                $choiceGroup->setSelectedIndex($index, 1);
            } else {
                $features->remove($gameFeature);
                $choiceGroup->setSelectedIndex($index, 0);
            }
        }
}


# throws Exception
sub updateMultiple {
    my ($self, $choiceGroup) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $METHOD_NAME = "updateMultiple";
        my $SELECTED_ARRAY_RETURN = "selectedArray_return[";
        my $SELECTED_SEP = "] = ";
        my $selectedArray_return = [(0) x ($choiceGroup->size())];
        my $total = $choiceGroup->getSelectedFlags($selectedArray_return);
        $stringBuffer->append("Multiple Total Choices: ");
        $stringBuffer->appendint($total);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $METHOD_NAME);
        my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
        for (my $index = 0; $index < scalar(@{$selectedArray_return}); $index++) {
            my $isSelected = $selectedArray_return->[$index];
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append($SELECTED_ARRAY_RETURN);
            $stringBuffer->appendint($index);
            $stringBuffer->append($SELECTED_SEP);
            $stringBuffer->appendboolean($isSelected);
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $METHOD_NAME);
            my $selectedChoiceLabel = $choiceGroup->getString($index);
            my $gameFeature = 'org::allbinary::game::configuration::feature::Feature'->getInstance($selectedChoiceLabel);
            if (!$isSelected && $features->isFeature($gameFeature)) {
                $features->remove($gameFeature);
            } elsif ($isSelected && !$features->isFeature($gameFeature)) {
                $features->add($gameFeature);
            }
        }
}


# throws Exception
sub updateExclusiveForChoiceGroup {
    my ($self, $choiceGroup) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $METHOD_NAME = "updateExclusive";
        my $SELECTED_ARRAY_RETURN = "selectedArray_return[";
        my $SELECTED_SEP = "] = ";
        my $selectedArray_return = [(0) x ($choiceGroup->size())];
        my $total = $choiceGroup->getSelectedFlags($selectedArray_return);
        $stringBuffer->append("Exclusive Total Choices: 1==");
        $stringBuffer->appendint($total);
        $self->{logUtil}->putF($stringBuffer->toString(), $self, $METHOD_NAME);
        for (my $index = 0; $index < scalar(@{$selectedArray_return}); $index++) {
            my $isSelected = $selectedArray_return->[$index];
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append($SELECTED_ARRAY_RETURN);
            $stringBuffer->appendint($index);
            $stringBuffer->append($SELECTED_SEP);
            $stringBuffer->appendboolean($isSelected);
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $METHOD_NAME);
            if ($isSelected) {
                my $selectedChoiceLabel = $choiceGroup->getString($index);
                $self->updateExclusive($selectedChoiceLabel);
            }
        }
}


sub isExclusive {
    my ($self, $itemLabel) = @_;
        my $enumeration = 'org::allbinary::game::configuration::feature::GameFeatureChoiceGroups'->getExclusiveInstance()->get()->keys();
        my $name = undef;
        while ($self->{enumerationUtil}->hasMoreElements($enumeration)) {
            $name = $self->{enumerationUtil}->nextElement($enumeration);
            if ($self->{tsUtil}->compareTo($itemLabel, $name) == 0) {
                return 1;
            }
        }
        return 0;
}


# throws Exception
sub updateExclusive {
    my ($self, $selectedChoiceLabel) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{ITEM_LABEL})->append($selectedChoiceLabel)->toString(), $self, "updateExclusive");
        my $gameFeature = 'org::allbinary::game::configuration::feature::Feature'->getInstance($selectedChoiceLabel);
        my $hashtable = 'org::allbinary::game::configuration::feature::GameFeatureChoiceGroups'->getExclusiveInstance()->get();
        my $objectArray = 'org::allbinary::util::HashtableUtil'->getInstance()->getKeysAsArray($hashtable);
        my $basicArrayList = undef;
        my $anyType = undef;
        my $size = scalar(@{$objectArray});
        for (my $index = 0; $index < $size; $index++) {
            $anyType = $objectArray->[$index];
            $basicArrayList = $hashtable->get($anyType);
            $self->updateExclusiveList($gameFeature, $basicArrayList);
        }
}


# throws Exception
sub updateExclusiveList {
    my ($self, $gameFeature, $list) = @_;
        if ($list->contains($gameFeature)) {
            my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
            my $addIndex = $list->indexOf($gameFeature);
            my $size = $list->size();
            for (my $index = 0; $index < $size; $index++) {
                if ($addIndex != $index) {
                    $features->remove($list->{objectArray}->[$index]);
                } else {
                    $features->add($list->{objectArray}->[$index]);
                }
            }
        }
}

use java::util::Enumeration;
# use javax::microedition::lcdui::ChoiceGroup;
use org::allbinary::TsUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::EnumerationUtil;
use org::allbinary::util::HashtableUtil;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::Feature;
use org::allbinary::game::configuration::feature::GameFeatureChoiceGroups;

1;

