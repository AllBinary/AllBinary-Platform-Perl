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

package org::allbinary::game::configuration::GameOptionsForm;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();
use parent -norequire,'org::allbinary::graphics::displayable::screen::CommandForm';


sub _init_fields {
    my ($self) = @_;
    $self->{meUtil} = 'org::allbinary::logic::MEUtil'->getInstance();
}


sub new {
    my ($class, $commandListener, $title, $backgrounBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($commandListener, $title, $backgrounBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->addConfiguration();
        my $gameFeatureFormUtil = 'org::allbinary::game::configuration::feature::GameFeatureFormUtil'->getInstance();
        $gameFeatureFormUtil->addChoiceGroup($self, 'org::allbinary::game::configuration::feature::GameFeatureChoiceGroups'->getExclusiveInstance()->get(), $javax::microedition::lcdui::Choice::EXCLUSIVE);
        $gameFeatureFormUtil->addChoiceGroup($self, 'org::allbinary::game::configuration::feature::GameFeatureChoiceGroups'->getMultipleInstance()->get(), $javax::microedition::lcdui::Choice::MULTIPLE);
        $self->initCommands($commandListener);
        $self->setItemStateListener('org::allbinary::game::configuration::feature::GameFeatureItemStateListener'->new($self));
        $self->addTextFieldsIfSimulated();
    return $self;
}


# throws Exception
sub closeClientInformation {
    my ($self, $abeClientInformation) = @_;
        $self->SUPER::close();
        $self->save($abeClientInformation);
}


sub addTextFieldsIfSimulated {
    my ($self) = @_;
        my $key = 'org::allbinary::input::gyro::OrientationData'->getInstance()->{ORIENTATION_SENSOR_INPUT};
        my $hashtable = 'org::allbinary::game::configuration::feature::GameFeatureChoiceGroups'->getExclusiveInstance()->get();
        if (defined($hashtable)) {
            my $listCanBeNull = $hashtable->get($key);
            if (defined($listCanBeNull)) {
                my $list = $listCanBeNull;
                if ($list->contains('org::allbinary::game::configuration::feature::SensorFeatureFactory'->getInstance()->{SIMULATED_ORIENTATION_SENSORS})) {
                    $self->addTextFields();
                }
            }
        }
}


sub addTextFields {
    my ($self) = @_;
        my $hashtable = 'org::allbinary::game::configuration::GameConfigurationTextInput'->getHashtable();
        my $size = $hashtable->size();
        my $objectArray = 'org::allbinary::util::HashtableUtil'->getInstance()->getKeysAsArray($hashtable);
        my $gameConfigurationTextInput = undef;
        my $textField = undef;
        for (my $index = 0; $index < $size; $index++) {
            $gameConfigurationTextInput = $hashtable->get($objectArray->[$index]);
            $textField = 'javax::microedition::lcdui::TextField'->new($gameConfigurationTextInput->getLabel(), $gameConfigurationTextInput->getText(), 30, $javax::microedition::lcdui::TextField::ANY);
            $self->{meUtil}->appendItem($self, $textField);
        }
}


sub addConfiguration {
    my ($self) = @_;
        my $METHOD_NAME = "addConfiguration";
        my $NAME = "Name: ";
        my $list = 'org::allbinary::game::configuration::GameConfigurationSingleton'->getInstance()->getOptionsBasicArrayList();
        my $GAUGE_CHANGE = 'org::allbinary::graphics::displayable::command::MyCommandsFactory'->getInstance()->{GAUGE_CHANGE};
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        my $size = $list->size();
        my $gameConfiguration = undef;
        my $gauge = undef;
        for (my $index = 0; $index < $size; $index++) {
            $gameConfiguration = $list->{objectArray}->[$index];
            $stringMaker->delete(0, $stringMaker->length());
            $self->{logUtil}->putF($stringMaker->append($NAME)->append($gameConfiguration->toString())->toString(), $self, $METHOD_NAME);
            $gauge = 'org::allbinary::game::configuration::GameConfigurationGauge'->new($gameConfiguration);
            $gauge->setDefaultCommand($GAUGE_CHANGE);
            $gauge->setItemCommandListener('org::allbinary::game::configuration::feature::GameFeatureItemCommandListener'->new($self));
            $self->{meUtil}->appendItem($self, $gauge);
        }
}


sub initCommands {
    my ($self, $cmdListener) = @_;
        my $gameCommandsFactory = 'org::allbinary::game::commands::GameCommandsFactory'->getInstance();
        $self->removeAllCommands();
        $self->addCommand($gameCommandsFactory->{CLOSE_OPTIONS});
        $self->addCommand($gameCommandsFactory->{DEFAULT_OPTIONS});
        $self->setCommandListener($cmdListener);
}


# throws Exception
sub save {
    my ($self, $abeClientInformation) = @_;
        my $size = $self->size();
        my $item = undef;
        for (my $index = 0; $index < $size; $index++) {
            $item = $self->get($index);
            if ((Scalar::Util::blessed($item) && $item->isa('org::allbinary::game::configuration::GameConfigurationGauge'))) {
                'org::allbinary::game::configuration::GameConfigurationUtil'->getInstance()->update($item);
            } elsif ((Scalar::Util::blessed($item) && $item->isa('javax::microedition::lcdui::TextField'))) {
                'org::allbinary::game::configuration::GameConfigurationTextInput'->update($item);
            }
        }
        'org::allbinary::game::configuration::GameConfigurationUtil'->getInstance()->updateCompetitionValue();
        my $hashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
        my $SCALE = 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->{SCALE};
        $hashtable->put($SCALE->getName(), $SCALE->getValue()->toString());
        my $keyValuePersistance = 'org::allbinary::game::configuration::persistance::GameConfigurationPersistanceSingleton'->getInstance();
        $keyValuePersistance->clear();
        $keyValuePersistance->loadAll($abeClientInformation);
        my $list = $keyValuePersistance->getIds();
        $keyValuePersistance->save($abeClientInformation, $hashtable);
        my $size2 = $list->size();
        my $integer = undef;
        for (my $index = 0; $index < $size2; $index++) {
            $integer = $list->{objectArray}->[$index];
            $keyValuePersistance->delete($abeClientInformation, int($integer));
        }
}

# use javax::microedition::lcdui::Choice;
# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Item;
# use javax::microedition::lcdui::TextField;
use org::allbinary::game::commands::GameCommandsFactory;
use org::allbinary::game::configuration::feature::GameFeatureChoiceGroups;
use org::allbinary::game::configuration::feature::GameFeatureFormUtil;
use org::allbinary::game::configuration::feature::GameFeatureItemCommandListener;
use org::allbinary::game::configuration::feature::GameFeatureItemStateListener;
use org::allbinary::game::configuration::feature::SensorFeatureFactory;
use org::allbinary::game::configuration::persistance::GameConfigurationPersistanceSingleton;
use org::allbinary::game::configuration::persistance::KeyValuePersistance;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::command::MyCommandsFactory;
use org::allbinary::graphics::displayable::screen::CommandForm;
use org::allbinary::input::gyro::OrientationData;
use org::allbinary::logic::MEUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::HashtableUtil;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::configuration::GameConfigurationTextInput;
use org::allbinary::game::configuration::GameConfigurationSingleton;
use org::allbinary::game::configuration::GameConfigurationGauge;
use org::allbinary::game::configuration::GameConfigurationUtil;
use org::allbinary::game::configuration::GameConfigurationCentral;

1;

