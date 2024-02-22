void setup() {
    int[] myMarks = {42, 24, 19, 98, 35, 36};

    println(myMarks);

    float sum = 0;
    for (int i = 0; i < myMarks.length; i++) {
        sum += myMarks[i];
    }
    println(sum / myMarks.length);
}
