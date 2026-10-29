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

package org::allbinary::logic::visual::dhtml::style::color::ColorsView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{commonPhoneStrings} = 'org::allbinary::string::CommonPhoneStrings'->getInstance();
    $self->{HEXRADIX} = 16;
    $self->{MAX} = 255;
    $self->{delta} = 20;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getColorNode {
    my ($self, $document, $redIndex, $greenIndex, $blueIndex) = @_;
        my $hexColorStringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        if ($redIndex < $self->{HEXRADIX}) {
            $hexColorStringBuffer->append($self->{commonPhoneStrings}->{ZERO});
        }
        $hexColorStringBuffer->append('Integer'->toString($redIndex, $self->{HEXRADIX}));
        if ($greenIndex < $self->{HEXRADIX}) {
            $hexColorStringBuffer->append($self->{commonPhoneStrings}->{ZERO});
        }
        $hexColorStringBuffer->append('Integer'->toString($greenIndex, $self->{HEXRADIX}));
        if ($blueIndex < $self->{HEXRADIX}) {
            $hexColorStringBuffer->append($self->{commonPhoneStrings}->{ZERO});
        }
        $hexColorStringBuffer->append('Integer'->toString($blueIndex, $self->{HEXRADIX}));
        my $colorNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::logic::visual::dhtml::style::color::ColorData'->getInstance()->{NAME}, $hexColorStringBuffer->toString());
        return $colorNode;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::logic::visual::dhtml::style::color::ColorsData'->getInstance()->{NAME}, "RGB Colors In Hex");
        my $blackNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::logic::visual::dhtml::style::color::ColorData'->getInstance()->{NAME}, "000000");
        $node->appendChild($blackNode);
        for (my $index = 0; $index < $self->{MAX}; $index += $self->{delta}) {
            my $hexColorStringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if ($index < $self->{HEXRADIX}) {
                $hexColorStringBuffer->append($self->{commonPhoneStrings}->{ZERO});
            }
            $hexColorStringBuffer->append('Integer'->toString($index, $self->{HEXRADIX}));
            if ($index < $self->{HEXRADIX}) {
                $hexColorStringBuffer->append($self->{commonPhoneStrings}->{ZERO});
            }
            $hexColorStringBuffer->append('Integer'->toString($index, $self->{HEXRADIX}));
            if ($index < $self->{HEXRADIX}) {
                $hexColorStringBuffer->append($self->{commonPhoneStrings}->{ZERO});
            }
            $hexColorStringBuffer->append('Integer'->toString($index, $self->{HEXRADIX}));
            my $colorNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::logic::visual::dhtml::style::color::ColorData'->getInstance()->{NAME}, $hexColorStringBuffer->toString());
            $node->appendChild($colorNode);
        }
        my $whiteNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::logic::visual::dhtml::style::color::ColorData'->getInstance()->{NAME}, "FFFFFF");
        $node->appendChild($whiteNode);
        for (my $blueIndex = int($self->{MAX} / 2); $blueIndex < $self->{MAX}; $blueIndex += $self->{delta}) {
            for (my $greenIndex = 0; $greenIndex < int($self->{MAX} / 2); $greenIndex += $self->{delta}) {
                for (my $redIndex = 0; $redIndex < int($self->{MAX} / 2); $redIndex += $self->{delta}) {
                    $node->appendChild($self->getColorNode($document, $redIndex, $greenIndex, $blueIndex));
                }
            }
        }
        for (my $redIndex = int($self->{MAX} / 2); $redIndex < $self->{MAX}; $redIndex += $self->{delta}) {
            for (my $greenIndex = 0; $greenIndex < int($self->{MAX} / 2); $greenIndex += $self->{delta}) {
                for (my $blueIndex = 0; $blueIndex < int($self->{MAX} / 2); $blueIndex += $self->{delta}) {
                    $node->appendChild($self->getColorNode($document, $redIndex, $greenIndex, $blueIndex));
                }
            }
        }
        for (my $greenIndex = int($self->{MAX} / 2); $greenIndex < $self->{MAX}; $greenIndex += $self->{delta}) {
            for (my $redIndex = 0; $redIndex < int($self->{MAX} / 2); $redIndex += $self->{delta}) {
                for (my $blueIndex = 0; $blueIndex < int($self->{MAX} / 2); $blueIndex += $self->{delta}) {
                    $node->appendChild($self->getColorNode($document, $redIndex, $greenIndex, $blueIndex));
                }
            }
        }
        for (my $greenIndex = 0; $greenIndex < $self->{MAX}; $greenIndex += 2 * $self->{delta}) {
            for (my $redIndex = 0; $redIndex < $self->{MAX}; $redIndex += 2 * $self->{delta}) {
                for (my $blueIndex = 0; $blueIndex < $self->{MAX}; $blueIndex += 2 * $self->{delta}) {
                    $node->appendChild($self->getColorNode($document, $redIndex, $greenIndex, $blueIndex));
                }
            }
        }
        return $node;
}

use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonPhoneStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::dhtml::style::color::ColorData;
use org::allbinary::logic::visual::dhtml::style::color::ColorsData;

1;

