# Generated Code Do Not Modify

package org::allbinary::graphics::form::ABCustomForm;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::CustomScreen';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub new {
    my ($class, $title, $items, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getAllitems {
    my ($self) = @_;
        return [(undef) x (0)];
}


sub size {
    my ($self) = @_;
        return 0;
}


sub setSelectedIndex {
    my ($self, $index) = @_;
}


sub getSelectedIndex {
    my ($self) = @_;
        return 0;
}


sub deleteAll {
    my ($self) = @_;
}


sub delete {
    my ($self, $itemNum) = @_;
}


sub append {
    my ($self, $item) = @_;
        return -1;
}


sub insert {
    my ($self, $itemNum, $item) = @_;
}


sub set {
    my ($self, $itemNum, $item) = @_;
}


sub get {
    my ($self, $itemNum) = @_;
        return 'org::allbinary::graphics::form::item::ABCustomItem'->getNullInstance();
}


sub getWidth {
    my ($self) = @_;
        die ("RuntimeException");
}


sub paint {
    my ($self, $graphics) = @_;
}


sub getTitle {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::graphics::form::CustomScreen;

1;

