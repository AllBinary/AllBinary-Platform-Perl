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

package org::allbinary::game::configuration::feature::GameFeatureItemStateListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();
use parent -norequire,'javax::microedition::lcdui::ItemStateListener';

our $toggleList = 'org::allbinary::util::BasicArrayListD'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{gameOptionsForm} = undef;
}


sub new {
    my ($class, $gameOptionsForm) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{gameOptionsForm} = $gameOptionsForm;
        my $gameFeatureFactory = 'org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance();
        'org::allbinary::game::configuration::feature::GameFeatureItemStateListener'->add($gameFeatureFactory->{ARTIFICIAL_INTELLEGENCE_PROCESSOR});
        'org::allbinary::game::configuration::feature::GameFeatureItemStateListener'->add($gameFeatureFactory->{COLLIDABLE_INTERFACE_LAYER_PROCESSOR});
        'org::allbinary::game::configuration::feature::GameFeatureItemStateListener'->add($gameFeatureFactory->{DAMAGE_FLOATERS});
        'org::allbinary::game::configuration::feature::GameFeatureItemStateListener'->add($gameFeatureFactory->{DROPPED_ITEMS});
        'org::allbinary::game::configuration::feature::GameFeatureItemStateListener'->add($gameFeatureFactory->{GAME_INPUT_LAYER_PROCESSOR});
        'org::allbinary::game::configuration::feature::GameFeatureItemStateListener'->add($gameFeatureFactory->{HEALTH_BARS});
        'org::allbinary::game::configuration::feature::GameFeatureItemStateListener'->add($gameFeatureFactory->{SOUND});
        'org::allbinary::game::configuration::feature::GameFeatureItemStateListener'->add($gameFeatureFactory->{TICKABLE_LAYER_PROCESSOR});
    return $self;
}


sub add {
    my ($class, $gameFeature) = @_;
        if (!$org::allbinary::game::configuration::feature::GameFeatureItemStateListener::toggleList->contains($gameFeature)) {
            $org::allbinary::game::configuration::feature::GameFeatureItemStateListener::toggleList->add($gameFeature);
        }
}


sub itemStateChanged {
    my ($self, $item) = @_;
        try {
            my $itemLabel = $item->getLabel();
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{ITEM_LABEL})->append($itemLabel)->toString(), $self, "itemStateChanged");
            if ((Scalar::Util::blessed($item) && $item->isa('org::allbinary::game::configuration::GameConfigurationGauge'))) {
                'org::allbinary::game::configuration::GameConfigurationUtil'->getInstance()->change($self->{gameOptionsForm}, $item);
            } elsif ((Scalar::Util::blessed($item) && $item->isa('javax::microedition::lcdui::ChoiceGroup'))) {
                my $gameFeatureUtil = 'org::allbinary::game::configuration::feature::GameFeatureUtil'->getInstance();
                if ($gameFeatureUtil->isExclusive($itemLabel)) {
                    $gameFeatureUtil->updateExclusiveForChoiceGroup($item);
                } else {
                    $gameFeatureUtil->updateMultiple($item);
                }
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "itemStateChanged", $e);
        }
}

# use javax::microedition::lcdui::ChoiceGroup;
# use javax::microedition::lcdui::Item;
# use javax::microedition::lcdui::ItemStateListener;
use org::allbinary::game::configuration::GameConfigurationGauge;
use org::allbinary::game::configuration::GameConfigurationUtil;
use org::allbinary::game::configuration::GameOptionsForm;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::game::configuration::feature::GameFeatureUtil;

1;

