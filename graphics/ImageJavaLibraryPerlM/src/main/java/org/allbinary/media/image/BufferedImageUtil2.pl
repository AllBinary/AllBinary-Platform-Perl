# Generated Code Do Not Modify

package org::allbinary::media::image::BufferedImageUtil2;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::BufferedImageUtil2'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{imageUtil} = 'org::allbinary::media::image::ImageUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::BufferedImageUtil2::instance;
}


sub createSpriteImage {
    my ($self, $bufferedImageArray) = @_;
        my $columns = scalar(@{$bufferedImageArray});
        my $max = $columns;
        my $rows = 0;
        if (scalar(@{$bufferedImageArray}) < $columns) {
            $columns = scalar(@{$bufferedImageArray});
        }
        $rows = (int(scalar(@{$bufferedImageArray}) / $columns));
        if (scalar(@{$bufferedImageArray}) % $columns != 0) {
            $rows++;
        }
        my $bufferedImage = $self->{imageUtil}->create($bufferedImageArray->[0]->getWidth(undef) * $columns, $bufferedImageArray->[0]->getHeight(undef) * $rows);
        my $g = $bufferedImage->createGraphics();
        my $columnIndex = 0;
        my $rowIndex = 0;
        for (my $index = 0; $index < scalar(@{$bufferedImageArray}); $index++) {
            if (int($index / $max) != 0 && $index % $max == 0) {
                $rowIndex++;
                $columnIndex = 0;
            }
            $g->drawImage($bufferedImageArray->[$index], $bufferedImageArray->[$index]->getWidth(undef) * $columnIndex, $bufferedImageArray->[$index]->getHeight(undef) * $rowIndex, $bufferedImageArray->[$index]->getWidth(undef), $bufferedImageArray->[$index]->getHeight(undef), undef);
            $columnIndex++;
        }
        $g->dispose();
        return $bufferedImage;
}

# use java::awt;
# use java::awt::image::BufferedImage;
use org::allbinary::media::image::ImageUtil;

1;

