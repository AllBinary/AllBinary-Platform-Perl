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

package org::allbinary::game::paint::help::InputMappingHelpPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::game::paint::help::HelpPaintable';

our $AND = " and ";
our $SEP = ", ";
our $MORE_THAN_TWO_IN_LIST_AND = ", and ";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{basicColorFactory} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
    $self->{NONE} = 'org::allbinary::game::input::GameKeyFactory'->getInstance()->{NONE};
    $self->{EMPTY_STRING} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{gameInputMappingArray} = undef;
    $self->{keyMappingArray} = [(undef) x (0)];
    $self->{actionBasicColor} = [(undef) x (0)];
    $self->{inputBasicColorArray} = [map { [(undef) x (0)] } 1 .. (0)];
    $self->{selectedBasicColor} = undef;
    $self->{updateMyFontProperties} = 'org::allbinary::game::paint::help::UpdateMyFontProperties'->new();
}


sub new {
    my ($class, $gameInputMappingArray, $backgroundBasicColor, $basicColor) = @_;
    my $self = $class->SUPER::new("Input Mapping", $backgroundBasicColor, $basicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{gameInputMappingArray} = $gameInputMappingArray;
        $self->update($self->{NONE}, $self->{NONE});
        if ($backgroundBasicColor == $self->{basicColorFactory}->{WHITE} || $basicColor == $self->{basicColorFactory}->{WHITE}) {
            $self->{selectedBasicColor} = $self->{basicColorFactory}->{RED};
        } else {
            $self->{selectedBasicColor} = $self->{basicColorFactory}->{WHITE};
        }
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        my $updateMyFontProperties = 'org::allbinary::game::paint::help::UpdateMyFontProperties'->new();
        $updateMyFontProperties->{charHeight} = $font->getHeight();
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        my $inputInfo = $self->{inputInfo};
        my $size = scalar(@{$inputInfo});
        $updateMyFontProperties->{actionStringArray} = [(undef) x ($size)];
        $updateMyFontProperties->{keymappingBeginWidthArray} = [(0) x ($size)];
        $updateMyFontProperties->{actionStringDeltaXArray} = [(0) x ($size)];
        $updateMyFontProperties->{inputDeltaXArray} = [map { [(0) x (0)] } 1 .. ($size)];
        $updateMyFontProperties->{sepArray} = [map { [(undef) x (0)] } 1 .. ($size)];
        $updateMyFontProperties->{sepWidthArray} = [map { [(0) x (0)] } 1 .. ($size)];
        my $list = undef;
        my $keyMappings = undef;
        my $actionString = undef;
        my $input = undef;
        my $size2 = 0;
        for (my $index = 0; $index < $size; $index++) {
            $list = $self->{keyMappingArray}->[$index];
            $keyMappings = $self->get($list);
            $stringMaker->delete(0, $stringMaker->length());
            $actionString = $stringMaker->append($inputInfo->[$index])->append($self->{commonSeps}->{COLON})->append($self->{commonSeps}->{SPACE})->append($self->{commonSeps}->{SPACE})->toString();
            $updateMyFontProperties->{actionStringArray}->[$index] = $actionString;
            $stringMaker->delete(0, $stringMaker->length());
            $updateMyFontProperties->{keymappingBeginWidthArray}->[$index] = (POSIX::floor(($font->stringWidth($stringMaker->append($updateMyFontProperties->{actionStringArray}->[$index])->append($keyMappings)->toString())) / (2 ** (1))));
            $updateMyFontProperties->{actionStringDeltaXArray}->[$index] = $font->stringWidth($actionString);
            $size2 = $list->size();
            $updateMyFontProperties->{inputDeltaXArray}->[$index] = [(0) x ($size2)];
            $updateMyFontProperties->{sepArray}->[$index] = [(undef) x ($size2)];
            $updateMyFontProperties->{sepWidthArray}->[$index] = [(0) x ($size2)];
            for (my $index2 = 0; $index2 < $size2; $index2++) {
                $input = $list->{objectArray}->[$index2];
                $updateMyFontProperties->{inputDeltaXArray}->[$index]->[$index2] = $font->stringWidth($input->getName());
                $updateMyFontProperties->{sepArray}->[$index]->[$index2] = $self->{EMPTY_STRING};
                if ($index2 + 1 < $list->size()) {
                    if ($list->size() == 2) {
                        $updateMyFontProperties->{sepArray}->[$index]->[$index2] = $org::allbinary::game::paint::help::InputMappingHelpPaintable::AND;
                    } else {
                        if ($index2 + 2 == $list->size()) {
                            $updateMyFontProperties->{sepArray}->[$index]->[$index2] = $org::allbinary::game::paint::help::InputMappingHelpPaintable::MORE_THAN_TWO_IN_LIST_AND;
                        } else {
                            $updateMyFontProperties->{sepArray}->[$index]->[$index2] = $org::allbinary::game::paint::help::InputMappingHelpPaintable::SEP;
                        }
                    }
                }
                if ($updateMyFontProperties->{sepArray}->[$index]->[$index2] ne $self->{EMPTY_STRING}) {
                    $updateMyFontProperties->{sepWidthArray}->[$index]->[$index2] = $font->stringWidth($updateMyFontProperties->{sepArray}->[$index]->[$index2]);
                }
            }
        }
        $self->{updateMyFontProperties} = $updateMyFontProperties;
        $self->SUPER::updateMeasurement($graphics);
}


sub update {
    my ($self, $selectedGameKey, $selectedInput) = @_;
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        $self->{logUtil}->putF($stringMaker->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL})->append("selected GameKey: ")->append($self->{stringUtil}->toString($selectedGameKey))->append(" Input: ")->append($self->{stringUtil}->toString($selectedInput))->toString(), $self, $self->{commonStrings}->{UPDATE});
        my $gameKeyMapping = 'org::allbinary::game::input::PlatformInputMappingFactory'->getInstance()->getPersistentInputMappingInstance();
        my $size = scalar(@{$self->{gameInputMappingArray}});
        my $keyInfo = [(undef) x ($size)];
        my $keyMappingArray = [(undef) x ($size)];
        my $actionBasicColor = [(undef) x ($size)];
        my $inputBasicColorArray = [(undef) x ($size)];
        my $gameInputMapping = undef;
        my $gameKey = undef;
        my $list = undef;
        for (my $index = 0; $index < $size; $index++) {
            $gameInputMapping = $self->{gameInputMappingArray}->[$index];
            $gameKey = $gameInputMapping->getGameKey();
            $list = $gameKeyMapping->getInputMapping()->getMappedInput($gameKey);
            my $size2 = $list->size();
            $inputBasicColorArray->[$index] = [(undef) x ($size2)];
            for (my $index2 = 0; $index2 < $size2; $index2++) {
                $inputBasicColorArray->[$index]->[$index2] = $self->{basicColor};
            }
            if ($gameKey == $selectedGameKey) {
                $stringMaker->delete(0, $stringMaker->length());
                $self->{logUtil}->putF($stringMaker->append("Found: selected GameKey: ")->append($self->{stringUtil}->toString($selectedGameKey))->toString(), $self, $self->{commonStrings}->{UPDATE});
                $actionBasicColor->[$index] = $self->{selectedBasicColor};
                my $indexOfSelectedInput = $list->indexOf($selectedInput);
                if ($indexOfSelectedInput >= 0) {
                    $stringMaker->delete(0, $stringMaker->length());
                    $self->{logUtil}->putF($stringMaker->append("Found: selected Input: ")->append($self->{stringUtil}->toString($selectedInput))->toString(), $self, $self->{commonStrings}->{UPDATE});
                    $inputBasicColorArray->[$index]->[$indexOfSelectedInput] = $self->{selectedBasicColor};
                }
            } else {
                $actionBasicColor->[$index] = $self->{basicColor};
            }
            $keyInfo->[$index] = $gameInputMapping->getName();
            $keyMappingArray->[$index] = $list;
        }
        $self->{keyMappingArray} = $keyMappingArray;
        $self->{actionBasicColor} = $actionBasicColor;
        $self->{inputBasicColorArray} = $inputBasicColorArray;
        $self->SUPER::setInputInfoP($keyInfo);
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


sub get {
    my ($self, $keyList) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $key = undef;
        my $size = $keyList->size();
        for (my $index = 0; $index < $size; $index++) {
            $key = $keyList->{objectArray}->[$index];
            $stringBuffer->append($key->getName());
            if ($index + 1 < $keyList->size()) {
                if ($keyList->size() == 2) {
                    $stringBuffer->append($org::allbinary::game::paint::help::InputMappingHelpPaintable::AND);
                } else {
                    if ($index + 2 == $keyList->size()) {
                        $stringBuffer->append($org::allbinary::game::paint::help::InputMappingHelpPaintable::MORE_THAN_TWO_IN_LIST_AND);
                    } else {
                        $stringBuffer->append($org::allbinary::game::paint::help::InputMappingHelpPaintable::SEP);
                    }
                }
            }
        }
        return $stringBuffer->toString();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        my $halfWidth = $self->{displayInfo}->getLastHalfWidth();
        $graphics->setColor(int($self->{basicColor}));
        $graphics->drawString($self->{title}, $halfWidth - $self->{titleBeginWidth}, $self->{updateMyFontProperties}->{charHeight}, $self->{anchor});
        my $inputInfo = $self->{inputInfo};
        my $size = scalar(@{$inputInfo});
        my $y = 0;
        my $deltaX = 0;
        my $size2 = 0;
        my $actionString = undef;
        my $input = undef;
        my $list = undef;
        my $sep = undef;
        my $beginWidth = 0;
        for (my $index = 0; $index < $size; $index++) {
            $y = ($index + 3) * $self->{updateMyFontProperties}->{charHeight};
            $deltaX = 0;
            $list = $self->{keyMappingArray}->[$index];
            $size2 = $list->size();
            $beginWidth = $self->{updateMyFontProperties}->{keymappingBeginWidthArray}->[$index];
            $graphics->setColor(int($self->{actionBasicColor}->[$index]));
            $actionString = $self->{updateMyFontProperties}->{actionStringArray}->[$index];
            $graphics->drawString($actionString, $halfWidth - $beginWidth + $deltaX, $y, $self->{anchor});
            $deltaX += $self->{updateMyFontProperties}->{actionStringDeltaXArray}->[$index];
            for (my $index2 = 0; $index2 < $size2; $index2++) {
                $input = $list->{objectArray}->[$index2];
                $graphics->setColor(int($self->{inputBasicColorArray}->[$index]->[$index2]));
                $graphics->drawString($input->getName(), $halfWidth - $beginWidth + $deltaX, $y, $self->{anchor});
                $deltaX += $self->{updateMyFontProperties}->{inputDeltaXArray}->[$index]->[$index2];
                $sep = $self->{updateMyFontProperties}->{sepArray}->[$index]->[$index2];
                $graphics->setColor(int($self->{basicColor}));
                $graphics->drawString($sep, $halfWidth - $beginWidth + $deltaX, $y, $self->{anchor});
                $deltaX += $self->{updateMyFontProperties}->{sepWidthArray}->[$index]->[$index2];
            }
        }
}
{
    package org::allbinary::game::paint::help::UpdateMyFontProperties;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use POSIX ();
    

    sub _init_fields {
        my ($self) = @_;
        $self->{actionStringArray} = 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance();
        $self->{keymappingBeginWidthArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY};
        $self->{actionStringDeltaXArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY};
        $self->{inputDeltaXArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY_ARRAY};
        $self->{sepArray} = [map { [(undef) x (0)] } 1 .. (0)];
        $self->{sepWidthArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY_ARRAY};
        $self->{charHeight} = 0;
    }

    sub new {
        my ($class) = @_;
        my $self = bless({}, $class);
        $self->_init_fields();
        return $self;
    }
    }


# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::input::GameKey;
use org::allbinary::game::input::GameKeyFactory;
use org::allbinary::game::input::Input;
use org::allbinary::game::input::PlatformInputMappingFactory;
use org::allbinary::game::input::mapping::GameInputMapping;
use org::allbinary::game::input::mapping::PersistentInputMapping;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::paint::help::HelpPaintable;

1;

