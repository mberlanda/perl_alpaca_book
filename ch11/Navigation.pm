package Navigation 0.01 {

  our @homeport = (21.283, -157.842);

  sub turn_toward_heading {
    my $new_heading = shift;
    my $current_heading = current_heading();
    print "Current heading is ", $current_heading, ".\n";
    my $direction = 'right';
    my $turn = ($new_heading - $current_heading) % 360;
    unless ($turn) {
      print "On course (good job!).\n";
      return;
    }
    print "Come about to $new_heading ";
    if ($turn > 180) {
      $turn = 360 - $turn;
      $direction = 'left';
    }
    print "by turning $direction $turn degrees.\n";
  }

  sub current_heading {
    return 234;
  }
}

package DropAnchor 1.23 {
  our @homeport = (21.283, -157.842);
}

1;
