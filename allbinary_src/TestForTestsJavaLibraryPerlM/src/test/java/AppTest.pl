# Generated Code Do Not Modify

package AppTest;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub testAddition {
    my ($self) = @_;
        'org::junit::jupiter::api::Assertions'->assertEquals(2, 1 + 1);
}


sub testStringEquality {
    my ($self) = @_;
        my $expected = "Hello World!";
        my $actual = "Hello World!";
        'org::junit::jupiter::api::Assertions'->assertEquals($expected, $actual);
}


sub testBooleanAssertions {
    my ($self) = @_;
        'org::junit::jupiter::api::Assertions'->assertTrue(1);
        'org::junit::jupiter::api::Assertions'->assertFalse(0);
}

use org::junit::jupiter::api::Assertions;
use org::junit::jupiter::api::DisplayName;
use org::junit::jupiter::api::Test;

1;

