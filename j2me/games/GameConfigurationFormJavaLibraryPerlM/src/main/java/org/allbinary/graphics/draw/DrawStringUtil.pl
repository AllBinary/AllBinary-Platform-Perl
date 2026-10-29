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

package org::allbinary::graphics::draw::DrawStringUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();

our $instance = 'org::allbinary::graphics::draw::DrawStringUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{EMPTY_STRING} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::draw::DrawStringUtil::instance;
}


sub drawCenterString {
    my ($self, $graphics, $string, $offset, $length, $x, $y) = @_;
        my $width = (POSIX::floor(($graphics->getFont()->substringWidth($string, $offset, $length)) / (2 ** (1))));
        try {
            $graphics->drawSubstring($string, $offset, $length, $x - $width, $y, $self->{anchor});
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append("Exception: stringLength: ")->appendint(length($string))->append(" offset: ")->appendint($offset)->append(" currentLength: ")->appendint($length)->toString(), $self, "drawCenterString");
        }
}


sub drawCenterStrings {
    my ($self, $graphics, $stringArray, $maxWidth, $charHeight, $x, $y) = @_;
        my $extraLines = 0;
        for (my $index = 0; $index < scalar(@{$stringArray}); $index++) {
            my $string = $stringArray->[$index];
            if ($string ne $self->{EMPTY_STRING}) {
                my $width = $graphics->getFont()->stringWidth($string);
                my $minTotalLines = 1;
                if ($width > $maxWidth) {
                    $minTotalLines = (int($width / $maxWidth)) + 1;
                }
                my $linePortion = int(length($string) / $minTotalLines);
                my $offset = 0;
                my $currentLength = $linePortion;
                my $size = length($string);
                while ($offset < $size) {
                    if ($offset + $currentLength > $size) {
                        $currentLength = $size - $offset;
                    }
                    if ($offset + $currentLength != $size) {
                        while ($currentLength > 0 && $stringArray->[$index]->charAt($offset + $currentLength) ne " ") {
                            $currentLength--;
                        }
                        if ($currentLength <= 4) {
                            $currentLength = $linePortion;
                        }
                    }
                    $self->drawCenterString($graphics, $string, $offset, $currentLength, $x, $y + (($index + $extraLines++) * $charHeight));
                    $offset = $offset + $currentLength;
                    $currentLength = $linePortion;
                }
                $extraLines--;
            }
        }
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::AndroidUtil;
use org::allbinary::J2MEUtil;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::opengles::OpenGLFeatureUtil;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;

1;

