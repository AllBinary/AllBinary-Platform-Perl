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

package org::allbinary::game::input::mapping::InputToGameKeyMapping;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::mapping::InputMapping';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{gameKeyFactory} = 'org::allbinary::game::input::GameKeyFactory'->getInstance();
    $self->{mappedGameKeys} = [$self->{gameKeyFactory}->{UP}, $self->{gameKeyFactory}->{DOWN}, $self->{gameKeyFactory}->{LEFT}, $self->{gameKeyFactory}->{RIGHT}];
    $self->{platformToGameKeyMapping} = [(undef) x ('org::allbinary::game::input::InputFactory'->getInstance()->{MAX})];
    $self->{negativePlatformToGameKeyMapping} = [(undef) x (0)];
}


sub getNullInstance {
    my ($class) = @_;
        if ($org::allbinary::game::input::mapping::InputToGameKeyMapping::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::input::mapping::InputToGameKeyMapping::instance = 'org::allbinary::game::input::mapping::InputToGameKeyMapping'->new();
        }
        return $org::allbinary::game::input::mapping::InputToGameKeyMapping::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        $self->clear();
    return $self;
}


sub clear {
    my ($self) = @_;
        for (my $index = scalar(@{$self->{platformToGameKeyMapping}}) - 1; $index >= 0; $index--) {
            $self->{platformToGameKeyMapping}->[$index] = $self->{gameKeyFactory}->{NONE};
        }
}


sub removeAll {
    my ($self) = @_;
        $self->SUPER::removeAll();
        $self->clear();
}


sub addMapping {
    my ($self, $inputToGameKeyMapping) = @_;
        for (my $index = $inputToGameKeyMapping->getMaxMappable() - 1; $index >= 0; $index--) {
            my $input = $inputToGameKeyMapping->getInstance($index);
            if ($input != $self->{gameKeyFactory}->{NONE}) {
                $self->addAll($input, $inputToGameKeyMapping->getMappedInput($input));
            }
        }
}


sub addAll {
    my ($self, $input, $list) = @_;
        for (my $index = $list->size() - 1; $index >= 0; $index--) {
            my $mappedToInput = $list->{objectArray}->[$index];
            $self->add($input, $mappedToInput);
        }
}


sub add {
    my ($self, $input, $mappedToInput) = @_;
        $self->SUPER::add($input, $mappedToInput);
        $self->set($input, $mappedToInput);
}


sub remove {
    my ($self, $input, $mappedToInput) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL})->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($input))->append(" == ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($mappedToInput))->toString(), $self, "InputToGameKeyMapping::remove");
        $self->SUPER::remove($input, $mappedToInput);
        $self->set($input, $self->{gameKeyFactory}->{NONE});
}


sub set {
    my ($self, $input, $mappedToInput) = @_;
        my $id = $mappedToInput->getId();
        if ($id >= 0 && $id < scalar(@{$self->{platformToGameKeyMapping}})) {
            $self->{platformToGameKeyMapping}->[$id] = $input;
        }
}


sub getMaxMappable {
    my ($self) = @_;
        return scalar(@{$self->{platformToGameKeyMapping}});
}


sub getReverseInstance {
    my ($self, $id) = @_;
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        my $inputFactory = 'org::allbinary::game::input::InputFactory'->getInstance();
        for (my $index = 0; $index < scalar(@{$self->{platformToGameKeyMapping}}); $index++) {
            if ($self->{platformToGameKeyMapping}->[$index]->getId() == $id) {
                my $input = $inputFactory->getInstanceById($index);
                if (defined($input)) {
                    $list->add($input);
                }
            }
        }
        return $list;
}


# throws Exception
sub initGameKey {
    my ($self, $canvas, $gameKey) = @_;
        my $key = $canvas->getKeyCode($gameKey->getId());
        if ($key < 0 && -$key < scalar(@{$self->{negativePlatformToGameKeyMapping}})) {
            $self->{negativePlatformToGameKeyMapping}->[-$key] = $gameKey;
        } elsif ($key > 0) {
            if ($self->{platformToGameKeyMapping}->[$key] == $self->{gameKeyFactory}->{NONE}) {
                $self->{platformToGameKeyMapping}->[$key] = $gameKey;
            }
        } else {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE('org::allbinary::logic::string::StringMaker'->new()->append($gameKey->toString())->append('org::allbinary::string::CommonSeps'->getInstance()->{COLON_SEP})->appendint($key)->toString(), $self, $self->{commonStrings}->{INIT}, ("Exception"));
        }
}


# throws Exception
sub getSmallestCanvasGameKeyCode {
    my ($self, $canvas) = @_;
        my $nextKey = 0;
        my $smallestKey = 0;
        for (my $index = scalar(@{$self->{mappedGameKeys}}); --$index >= 0; ) {
            $nextKey = $canvas->getKeyCode($self->{mappedGameKeys}->[$index]->getId());
            if ($nextKey < $smallestKey) {
                $smallestKey = $nextKey;
            }
        }
        return $smallestKey;
}


sub init {
    my ($self, $canvas) = @_;
        try {
            my $negativePlatformToGameKeyMapping = [(undef) x (0)];
            my $smallestKey = $self->getSmallestCanvasGameKeyCode($canvas);
            if ($smallestKey < 0) {
                $smallestKey--;
                if ($smallestKey < -256) {
                    $smallestKey = -256;
                }
                $negativePlatformToGameKeyMapping = [(undef) x (-$smallestKey)];
                for (my $index = scalar(@{$negativePlatformToGameKeyMapping}); --$index >= 0; ) {
                    $negativePlatformToGameKeyMapping->[$index] = $self->{gameKeyFactory}->{NONE};
                }
                $self->{negativePlatformToGameKeyMapping} = $negativePlatformToGameKeyMapping;
            }
            for (my $index = scalar(@{$self->{mappedGameKeys}}); --$index >= 0; ) {
                $self->initGameKey($canvas, $self->{mappedGameKeys}->[$index]);
            }
        } catch ($t) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{INIT}, $t);
        }
}


sub getInstanceForCanvas {
    my ($self, $canvas, $id) = @_;
        if ($id >= 0 && $id < scalar(@{$self->{platformToGameKeyMapping}})) {
            return $self->{platformToGameKeyMapping}->[$id];
        } elsif ($id < 0 && -$id < scalar(@{$self->{negativePlatformToGameKeyMapping}})) {
            return $self->{negativePlatformToGameKeyMapping}->[-$id];
        } else {
            return $self->{gameKeyFactory}->{NONE};
        }
}


sub getInstance {
    my ($self, $id) = @_;
        if ($id >= 0 && $id < scalar(@{$self->{platformToGameKeyMapping}})) {
            return $self->{platformToGameKeyMapping}->[$id];
        } elsif ($id < 0 && -$id < scalar(@{$self->{negativePlatformToGameKeyMapping}})) {
            return $self->{negativePlatformToGameKeyMapping}->[-$id];
        } else {
            return $self->{gameKeyFactory}->{NONE};
        }
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::game::input::GameKey;
use org::allbinary::game::input::GameKeyFactory;
use org::allbinary::game::input::Input;
use org::allbinary::game::input::InputFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::game::input::mapping::InputMapping;

1;

