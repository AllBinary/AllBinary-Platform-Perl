# Generated Code Do Not Modify

package org::allbinary::graphics::form::MultipleScrollSelectionHorizontalForm;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::ScrollSelectionForm','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{rectPaintable} = 'org::allbinary::graphics::paint::NullPaintable'->getInstance();
    $self->{multipleScrollSelectionHorizontalFormTypeItemIndexPaintable} = 'org::allbinary::graphics::form::ItemIndexPaintable'->getInstance();
    $self->{backgroundColor} = int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{TRANSPARENT_GREY});
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{logged} = 0;
    $self->{fontHeight} = 0;
}


# throws Exception
sub createForm {
    my ($class, $title, $items, $rectangle, $formType, $border, $backgroundBasicColor, $foregroundBasicColor) = @_;
        my $scrollSelectionForm = 'org::allbinary::graphics::form::MultipleScrollSelectionHorizontalForm'->new($title, $items, 'org::allbinary::graphics::form::ItemPaintableFactory'->getInstance(), $border, $backgroundBasicColor, $foregroundBasicColor);
        $scrollSelectionForm->init($rectangle, $formType);
        return $scrollSelectionForm;
}


sub new {
    my ($class, $title, $items, $formPaintableFactory, $border, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($title, $items, $formPaintableFactory, $border, 3, $backgroundBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        if ('org::allbinary::J2MEUtil'->isJ2ME() || 'org::allbinary::J2MEUtil'->isHTML()) {
        } else {
            {
            package org::allbinary::graphics::form::MPaintable;
            use strict;
            use warnings;
            use feature 'try';
            no warnings 'experimental::try';
            use parent -norequire,'org::allbinary::graphics::paint::Paintable';
            

            sub new {
                my ($class) = @_;
                my $self = $class->SUPER::new();
                return $self;
            }
            

            sub paint {
                my ($self, $graphics) = @_;
                    $self->fillRect($graphics);
            }
            }

            $self->{rectPaintable} = 'org::allbinary::graphics::form::MPaintable'->new();
        }
    return $self;
}


sub fillRect {
    my ($self, $graphics) = @_;
        $graphics->setColor($self->{backgroundColor});
        $graphics->fillRect($self->{x}, $self->{y}, $self->{rectangle}->getWidth(), $self->{rectangle}->getHeight());
}


# throws Exception
sub init {
    my ($self, $rectangle, $formType) = @_;
        $self->SUPER::init($rectangle, $formType);
        my $formTypeFactory = 'org::allbinary::graphics::form::FormTypeFactory'->getInstance();
        if ($formType == $formTypeFactory->{HORIZONTAL_FORM}) {
            $self->{multipleScrollSelectionHorizontalFormTypeItemIndexPaintable} = 'org::allbinary::graphics::form::MultipleScrollSelectionFormHorizontalPaintable'->new($self);
        } elsif ($formType == $formTypeFactory->{VERTICAL_CENTER_FORM}) {
            $self->{multipleScrollSelectionHorizontalFormTypeItemIndexPaintable} = 'org::allbinary::graphics::form::MultipleScrollSelectionFormVerticalPaintable'->new($self);
        } elsif ($formType == $formTypeFactory->{NULL_FORM_TYPE}) {
        } else {
            die ($formTypeFactory->{UNK});
        }
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{fontHeight} = $font->getHeight();
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


# throws Exception
sub paintHorizontal {
    my ($self, $graphics, $index, $item, $dx, $dy) = @_;
        my $dx2 = $self->paintItem($graphics, $index, $item, $dx, $dy) + $self->{border};
        $self->{paintable}->paint($graphics, $index, $dx, $dy);
        $dx = $dx2;
        return $dx;
}


# throws Exception
sub paintVertical {
    my ($self, $graphics, $index, $item, $dx, $dy) = @_;
        $self->paintItem($graphics, $index, $item, $dx, $dy);
        $self->{paintable}->paint($graphics, $index, $dx, $dy);
        return $dx;
}


sub getStartIndex {
    my ($self) = @_;
        return $self->getSelectedIndex();
}


sub paint {
    my ($self, $graphics) = @_;
        try {
            $self->{myFontProcessor}->process($graphics);
            my $start = $self->getStartIndex();
            my $size = $self->size();
            my $dx = $self->{x};
            my $dy = $self->{y};
            $self->{rectPaintable}->paint($graphics);
            $graphics->drawString($self->getTitle(), $self->{x}, $self->{y} - $self->{fontHeight}, 0);
            my $item = undef;
            for (my $index = $start; $index < $size; $index++) {
                $item = $self->get($index);
                if ($dx >= $self->{rectangle}->getMaxX()) {
                    if ($self->{logged}) {
                    } else {
                        $self->{logged} = 1;
                        'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append("painting beyond maxx: ")->appendint(int($self->{rectangle}->getMaxX()))->toString(), $self, $self->{canvasStrings}->{PAINT});
                    }
                }
                $dx = $self->{multipleScrollSelectionHorizontalFormTypeItemIndexPaintable}->paint($graphics, $index, $item, $dx, $dy);
            }
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{canvasStrings}->{PAINT});
        }
}
{
    package org::allbinary::graphics::form::MultipleScrollSelectionFormHorizontalPaintable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::graphics::form::ItemIndexPaintable';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{multipleScrollSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $multipleScrollSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{multipleScrollSelectionForm} = $multipleScrollSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub paint {
        my ($self, $graphics, $index, $item, $dx, $dy) = @_;
            return $self->{multipleScrollSelectionForm}->paintHorizontal($graphics, $index, $item, $dx, $dy);
    }
    }

{
    package org::allbinary::graphics::form::MultipleScrollSelectionFormVerticalPaintable;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::graphics::form::ItemIndexPaintable';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{multipleScrollSelectionForm} = undef;
    }
    

    sub new {
        my ($class, $multipleScrollSelectionForm) = @_;
        my $self = $class->SUPER::new();
        $self->_init_fields();
            $self->{multipleScrollSelectionForm} = $multipleScrollSelectionForm;
        return $self;
    }
    

    # throws Exception
    sub paint {
        my ($self, $graphics, $index, $item, $dx, $dy) = @_;
            return $self->{multipleScrollSelectionForm}->paintVertical($graphics, $index, $item, $dx, $dy);
    }
    }


# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::J2MEUtil;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::graphics::form::ItemPaintableFactory;
use org::allbinary::graphics::form::ItemIndexPaintable;
use org::allbinary::graphics::form::FormTypeFactory;

1;

