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

package org::allbinary::animation::text::TextAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{updateMyFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{myFontProcessor} = $self->{updateMyFontProcessor};
    $self->{textArrayP} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{ONE_EMPTY_STRING_ARRAY};
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
    $self->{fontHeight} = 0;
    $self->{offsetY} = 0;
    $self->{textChangeListener} = 'org::allbinary::animation::text::TextChangeListener'->getInstance();
}


sub new {
    my ($class, $text, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->setText($text);
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{fontHeight} = $font->getHeight();
        my $adjustedFontHeight = int(-($self->{fontHeight} * 2.00));
        $self->{offsetY} = ('org::allbinary::graphics::threed::SWTJOGLProcessor'->getInstance()->isJOGL() ? $adjustedFontHeight : 0);
        $self->{textChangeListener}->onMeasure();
        $self->{textChangeListener} = 'org::allbinary::animation::text::TextChangeListener'->getInstance();
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


# throws Exception
sub nextFrame {
    my ($self) = @_;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->paintXYNoUpdate($graphics, $x, $y);
}


sub paintXYNoUpdate {
    my ($self, $graphics, $x, $y) = @_;
        $self->{basicSetColorUtil}->setBasicColorP3($graphics, $self->getBasicColorP(), $self->getColor());
        my $size = scalar(@{$self->{textArrayP}});
        for (my $index = 0; $index < $size; $index++) {
            $graphics->drawString($self->{textArrayP}->[$index], $x, $y + $self->{offsetY} + ($index * $self->{fontHeight}), $self->{anchor});
        }
}


sub setTextWithOnMeasure {
    my ($self, $text, $textChangeListener) = @_;
        $self->setText($text);
        $self->{textChangeListener} = $textChangeListener;
}


sub setText {
    my ($self, $text) = @_;
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        if (defined($text) && length($text) > 0) {
            my $index = 0;
            my $startIndex = 0;
            my $endIndex = 0;
            while ($index >= 0) {
                $startIndex = $index;
                $index = index($text, "\n", $startIndex);
                $endIndex = $index;
                if ($index < 0) {
                    $endIndex = length($text);
                }
                $list->add(substr($text, $startIndex, ($endIndex) - ($startIndex)));
                if ($index < 0) {
                    last;
                }
                $index++;
            }
        }
        if ($list->size() > 0) {
            my $textArray = [(undef) x ($list->size())];
            my $size = $list->size();
            for (my $index = 0; $index < $size; $index++) {
                $textArray->[$index] = $list->get($index);
            }
            $self->{textArrayP} = $textArray;
        } else {
            $self->{textArrayP} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{ONE_EMPTY_STRING_ARRAY};
        }
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


sub getTextArray {
    my ($self) = @_;
        return $self->{textArrayP};
}


sub getFontHeight {
    my ($self) = @_;
        return $self->{fontHeight};
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::threed::SWTJOGLProcessor;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::animation::text::TextChangeListener;

1;

