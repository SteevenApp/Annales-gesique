AnimatedContainer(
  duration: Duration(milliseconds: 300),
  margin: EdgeInsets.symmetric(vertical: 4),
  decoration: BoxDecoration(
    color: isSelected
        ? (isCorrect ? Colors.green[100] : Colors.red[100])
        : Colors.grey[50],
    borderRadius: BorderRadius.circular(8),
  ),
  child: ListTile(...),
)